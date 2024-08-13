import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/services/signal_r/app_signal_r_service.dart';
import 'package:food_driver/core/services/signal_r/signal_r_service.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/domain/entities/loose_win_entity.dart';
import 'package:food_driver/features/game/domain/entities/marker_entity.dart';
import 'package:food_driver/features/game/domain/entities/route_marker.dart';
import 'package:food_driver/features/game/domain/usecases/load.dart';
import 'package:food_driver/features/game/domain/usecases/send_tap.dart';
import 'package:food_driver/features/game/domain/usecases/move_and_split_polyline.dart';
import 'package:food_driver/features/game/domain/usecases/play.dart';
import 'package:food_driver/features/game/domain/usecases/start.dart';
import 'package:food_driver/features/game/domain/usecases/take_route.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/domain/entities/user_location_entity.dart';
import 'package:food_driver/features/location/domain/usecases/city_by_lat_lng.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  final LoadUseCase _load;
  final CityByLatLngUseCase _userLocationByLatLng;
  final StartUseCase _start;
  final TakeRouteUseCase _takeRoute;
  final SendTapUseCase _sendTap;
  final AppSignalRService _signalRService;

  final MoveAndSplitPolylineUseCase _moveAndSplitPolylineUseCase;

  final velocity = 1.0; // meter on tap

  GameBloc(
    this._load,
    this._start,
    this._takeRoute,
    this._sendTap,
    this._userLocationByLatLng,
    this._signalRService,
    this._moveAndSplitPolylineUseCase,
  ) : super(const GameState()) {
    on<GamePrepareInfoEvent>(_prepareInfo);
    on<GameStartEvent>(_startGame);
    on<GamePlayEvent>(_playGame);
    on<GameAddMarkersEvent>(_addMarkers);
    on<GameAddPolylinesEvent>(_addPolylines);
    on<GameBreakEvent>(_breakGame);
    on<GameInitializedEvent>(_initializedGame);
    on<GameLooseEvent>(_looseGame);
    on<GameWinEvent>(_winGame);
    on<GameTapEvent>(_onTap);
    on<GameUpdateSpeedEvent>(_updateSpeed);
    on<GetCityEvent>(_tryGetCity);
    on<GameNoCityEvent>(_noCity);
    on<GameAddRoutesEvent>(_addRoutes);
    _signalRService.onEventSignalR.listen(signalRListener);
  }

  void _prepareInfo(
    GamePrepareInfoEvent event,
    Emitter<GameState> emit,
  ) async {
    _start.call(event.city.id);
    await RouteMarker.preapareBitmaps();
    // final response = await _load.call(event.city.id);
    // response.fold(
    //   (error) {
    //     emit(state.copyWith(status: GameStateType.error));
    //   },
    //   (result) {
    //     emit(state.copyWith(
    //       status: GameStateType.initialized,
    //       routes: result,
    //     ));
    //   },
    // );
  }

  void _startGame(
    GameStartEvent event,
    Emitter<GameState> emit,
  ) async {
    final route = state.routes.firstWhere((route) => route.id == event.routeId);
    final gameMarkers =
        await RouteMarker.createMarkers(entities: route.startFinishEntities);

    emit(state.copyWith(
      status: GameStateType.starting,
      gameRoute: route,
      markers: gameMarkers,
      distance: 0,
      polylineAfter: Polyline(
        polylineId: PolylineId('${event.routeId}_after'),
        points: route.points,
        color: AppColors.black,
        width: 2,
      ),
      polylines: {
        Polyline(
          polylineId: PolylineId(event.routeId.toString()),
          points: route.points,
          color: AppColors.black,
          width: 2,
        ),
      },
    ));
  }

  void _playGame(
    GamePlayEvent event,
    Emitter<GameState> emit,
  ) {
    if (state.gameRoute?.id != null) {
      _takeRoute.call(state.gameRoute!.id);
    }
    emit(state.copyWith(
      status: GameStateType.playing,
      timer: Timer.periodic(const Duration(seconds: 1), timerCallback),
      tapCount: 0,
      speed: 0,
      seconds: state.gameRoute?.seconds ?? 0,
    ));
  }

  void _addMarkers(
    GameAddMarkersEvent event,
    Emitter<GameState> emit,
  ) {
    emit(state.copyWith(
      markers: event.markers,
    ));
  }

  void _addPolylines(
    GameAddPolylinesEvent event,
    Emitter<GameState> emit,
  ) {
    emit(state.copyWith(
      polylines: event.polylines,
    ));
  }

  void _breakGame(
    GameBreakEvent event,
    Emitter<GameState> emit,
  ) async {
    state.timer?.cancel();
    final (routes, markers) = await _updatedMarkers();
    emit(state.copyWith(
      status: GameStateType.initialized,
      polylines: {},
      markers: markers,
      routes: routes,
      timer: null,
    ));
  }

  void _initializedGame(
    GameInitializedEvent event,
    Emitter<GameState> emit,
  ) async {
    final markers = await RouteMarker.createMarkers(
      entities: markerEntities(state.routes),
      onTap: (routeId) => add(GameStartEvent(routeId)),
    );
    emit(state.copyWith(
      status: GameStateType.initialized,
      polylines: {},
      markers: markers,
    ));
  }

  void _looseGame(
    GameLooseEvent event,
    Emitter<GameState> emit,
  ) async {
    state.timer?.cancel();
    final (routes, markers) = await _updatedMarkers();
    final progress = state.tapCount / max((state.gameRoute?.tapCount ?? 0), 1);
    final looseWin = LooseWinEntity(
      totalTime: state.gameRoute?.seconds ?? 0,
      progress: progress > 1 ? 0 : progress,
    );
    emit(state.copyWith(
      status: GameStateType.loose,
      polylines: {},
      timer: null,
      markers: markers,
      routes: routes,
      looseWin: looseWin,
    ));
  }

  void _winGame(
    GameWinEvent event,
    Emitter<GameState> emit,
  ) async {
    state.timer?.cancel();
    final (routes, markers) = await _updatedMarkers();
    emit(state.copyWith(
      status: GameStateType.win,
      polylines: {},
      markers: markers,
      routes: routes,
      timer: null,
      looseWin: LooseWinEntity(reward: state.gameRoute?.reward),
      balance: (state.balance ?? 0) + event.balance,
    ));
  }

  void _onTap(
    GameTapEvent event,
    Emitter<GameState> emit,
  ) {
    final newCount = state.tapCount + 1;
    if ((state.gameRoute?.tapCount ?? 0) == newCount) {
      _sendTap.call(
          currentSecond:
              max(((state.gameRoute?.seconds ?? 0) - state.seconds), 0),
          tapCount: state.tapCount - state.tapInSecond);
      return;
    }
    var distanceDelta = (state.gameRoute?.metersPerClick ?? 0);
    if (distanceDelta == 0) distanceDelta = 5;

    final distance = state.distance + distanceDelta;
    final moveRecords =
        _moveAndSplitPolylineUseCase(MoveAndSplitPolylineUseCaseParams(
      polylinePoints: state.gameRoute?.coordinatesListSafe
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList() ??
          [],
      distance: distance,
    ));
    emit(
      state.copyWith(
        tapCount: newCount,
        distance: distance,
        markers: RouteMarker.getMarkers(
          entities: {
            MarkerEntity(
              markerId: -2,
              coordinate: moveRecords.$3.last,
              markerType: MarkerType.finish,
            ),
            MarkerEntity(
              markerId: -1,
              coordinate: moveRecords.$1,
              markerType: MarkerType.driver,
            ),
          },
        ),
        polylineAfter: Polyline(
          polylineId: PolylineId('${state.gameRoute?.id}_after'),
          points: moveRecords.$3,
          color: AppColors.black,
          width: 2,
        ),
      ),
    );
  }

  void _updateSpeed(
    GameUpdateSpeedEvent event,
    Emitter<GameState> emit,
  ) {
    final passedSeconds = (state.gameRoute?.seconds ?? 0) - state.seconds;
    emit(state.copyWith(
      speed: passedSeconds == 0
          ? 0
          : state.tapCount / ((state.gameRoute?.seconds ?? 0) - state.seconds),
      seconds: event.seconds,
      tapInSecond: event.tapInSeconds,
    ));
  }

  Future<(List<DriveRouteEntity>, Set<Marker>)> _updatedMarkers() async {
    var routes = [...state.routes];
    routes.removeWhere((route) => route.id == state.gameRoute?.id);
    final markers = await RouteMarker.createMarkers(
      entities: markerEntities(routes),
      onTap: (routeId) => add(GameStartEvent(routeId)),
    );
    return (routes, markers);
  }

  Set<MarkerEntity> markerEntities(List<DriveRouteEntity> routes) => routes
      .map((route) => route.markerEntity)
      .whereType<MarkerEntity>()
      .toSet();

  void timerCallback(Timer timer) {
    if (state.seconds == 0) {
      timer.cancel();
      return;
    } else {
      final seconds = max(state.seconds - 1, 0);
      _sendTap.call(
          currentSecond: max(((state.gameRoute?.seconds ?? 0) - seconds), 0),
          tapCount: state.tapCount - state.tapInSecond);
      print(
          "BBB currentSecond: = ${max(((state.gameRoute?.seconds ?? 0) - seconds), 0)}, tapCount: = ${state.tapCount - state.tapInSecond}");
      add(GameUpdateSpeedEvent(seconds: seconds, tapInSeconds: state.tapCount));
    }
  }

  void _tryGetCity(
    GetCityEvent event,
    Emitter<GameState> emit,
  ) async {
    if (state.status != GameStateType.loading) {
      emit(state.copyWith(status: GameStateType.loading));
    }
    final response = await _userLocationByLatLng.call(event.latLng);
    UserLocationEntity? userLocation;
    response.fold(
      (error) {
        emit(state.copyWith(status: GameStateType.noCity));
      },
      (result) {
        userLocation = result;
      },
    );
    if (userLocation == null) {
      return;
    }
    if (userLocation!.city?.id == null) {
      emit(state.copyWith(status: GameStateType.error));
      return;
    }
    event.updateCity?.call(userLocation!.city!);
    final response1 = await _load.call(userLocation!.city!.id);
    response1.fold(
      (error) {
        emit(state.copyWith(status: GameStateType.error));
      },
      (result) {
        emit(state.copyWith(
          status: GameStateType.initialized,
          routes: result,
        ));
      },
    );
  }

  void _noCity(
    GameNoCityEvent event,
    Emitter<GameState> emit,
  ) {
    if (state.status != GameStateType.noCity) {
      emit(state.copyWith(status: GameStateType.noCity));
    }
  }

  void signalRListener(SignalREvent event) {
    if (event is AddRoutesEvent) {
      add(GameAddRoutesEvent(
          routes: event.routes.map((route) => route.toEntity()).toList()));
    } else if (event is RewardEvent) {
      print("BBB RewardEvent");
      add(GameWinEvent(balance: event.reward ?? 0));
    } else if (event is RouteCompletedFailedEvent) {
      print("BBB GameLooseEvent");
      add(const GameLooseEvent());
    }
  }

  void _addRoutes(
    GameAddRoutesEvent event,
    Emitter<GameState> emit,
  ) {
    if (state.routes.isEmpty && state.status == GameStateType.loading) {
      emit(state.copyWith(
        status: GameStateType.initialized,
        routes: event.routes,
      ));
      return;
    }
    emit(state.copyWith(routes: event.routes));
  }
}
