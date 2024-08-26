import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/services/signal_r/signal_r_service.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/domain/entities/loose_win_entity.dart';
import 'package:food_driver/features/game/domain/entities/marker_entity.dart';
import 'package:food_driver/features/game/domain/entities/route_marker.dart';
import 'package:food_driver/features/game/domain/usecases/cancel_route.dart';
import 'package:food_driver/features/game/domain/usecases/move_and_split_polyline.dart';
import 'package:food_driver/features/game/domain/usecases/send_tap.dart';
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
  final CityByLatLngUseCase _userLocationByLatLng;
  final StartUseCase _start;
  final TakeRouteUseCase _takeRoute;
  final CancelRouteUseCase _cancelRoute;
  final SendTapUseCase _sendTap;
  final AppSignalRService _signalRService;

  final MoveAndSplitPolylineUseCase _moveAndSplitPolylineUseCase;

  final velocity = 1.0; // meter on tap
  late final StreamSubscription _signalRSubscription;

  static const int _timerTick = 1;
  static const int speedSecondsTime = 10;
  static const int startingSeconds = 3;
  static const LatLng _defaultPosition =
      LatLng(55.75399399999374, 37.62209300000001);
  static const double _defaultZoom = 14.4746;

  int get clearGameDseconds =>
      max(((state.gameRoute?.seconds ?? 0) - startingSeconds), 0);
  int get routeTotalDseconds => clearGameDseconds * 10;
  int get secondsFromStart => routeTotalDseconds - state.dseconds;
  int get tapCount => state.secondsWithTapsMap.isEmpty
      ? 0
      : state.secondsWithTapsMap.values.reduce((a, b) => a + b);
  int get tapInTimerTick => state.secondsWithTapsMap.containsKey(state.dseconds)
      ? state.secondsWithTapsMap[state.dseconds] ?? 0
      : 0;
  int get currentSecond => (max(secondsFromStart, 0) / 10).ceil();

  GameBloc(
    this._start,
    this._takeRoute,
    this._cancelRoute,
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
    _signalRSubscription = _signalRService.onEventSignalR
        .asBroadcastStream()
        .listen(signalRListener);
  }

  void _prepareInfo(
    GamePrepareInfoEvent event,
    Emitter<GameState> emit,
  ) async {
    final response = await _start.call(event.city.id);
    response.fold(
      (error) {
        emit(state.copyWith(
          balance: event.balance,
          city: event.city,
          status: GameStateType.error,
        ));
      },
      (result) {
        if (event.city.location == null) {
          emit(state.copyWith(
            balance: event.balance,
            city: event.city,
          ));
          return;
        }
        emit(state.copyWith(
          balance: event.balance,
          cameraPosition: CameraPosition(
            target: LatLng(
              event.city.location!.latitude,
              event.city.location!.longitude,
            ),
            zoom: state.cameraPosition.zoom,
          ),
          city: event.city,
        ));
      },
    );
  }

  void _startGame(
    GameStartEvent event,
    Emitter<GameState> emit,
  ) async {
    final response = await _takeRoute.call(event.routeId);
    response.fold(
      (error) {
        return;
      },
      (result) {
        final route =
            state.routes.firstWhere((route) => route.id == event.routeId);
        final gameMarkers =
            RouteMarker.getMarkers(entities: route.startFinishEntities);
        if (route.coordinatesListSafe.isEmpty) {
          return;
        }
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
          cameraPosition: CameraPosition(
            target: route.startPoint!.gmLatLng,
            zoom: state.cameraPosition.zoom,
          ),
        ));
      },
    );
  }

  void _playGame(
    GamePlayEvent event,
    Emitter<GameState> emit,
  ) {
    emit(state.copyWith(
      status: GameStateType.playing,
      timer: Timer.periodic(const Duration(milliseconds: 100), timerCallback),
      speed: 0,
      dseconds: routeTotalDseconds,
      lastTapWasSend: false,
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
    await _cancelRoute.call(NoParams());
    if (state.city?.id != null) {
      _start.call(state.city!.id);
    }
    emit(state.copyWith(
      status: GameStateType.initialized,
      polylines: {},
      markers: {},
      polylineAfter: null,
      distance: 0,
      routes: [],
      gameRoute: null,
      timer: null,
      secondsWithTapsMap: {},
      lastTapWasSend: false,
      cameraPosition: CameraPosition(
        target: state.city?.location?.gmLatLng ?? state.cameraPosition.target,
        zoom: state.cameraPosition.zoom,
      ),
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
    if (state.status != GameStateType.playing) return;
    state.timer?.cancel();
    final progress = tapCount / max((state.gameRoute?.tapCount ?? 0), 1);
    final looseWin = LooseWinEntity(
      totalTime: max(state.gameRoute?.seconds ?? 0 - startingSeconds, 0),
      progress: progress > 1 ? 0 : progress,
    );
    emit(state.copyWith(
      status: GameStateType.loose,
      polylines: {},
      timer: null,
      markers: {},
      routes: [],
      polylineAfter: null,
      gameRoute: null,
      distance: 0,
      looseWin: looseWin,
      secondsWithTapsMap: {},
      lastTapWasSend: false,
      cameraPosition: CameraPosition(
        target: state.city?.location?.gmLatLng ?? state.cameraPosition.target,
        zoom: state.cameraPosition.zoom,
      ),
    ));
  }

  void _winGame(
    GameWinEvent event,
    Emitter<GameState> emit,
  ) async {
    if (state.status != GameStateType.playing) return;
    state.timer?.cancel();
    emit(state.copyWith(
      status: GameStateType.win,
      polylines: {},
      markers: {},
      routes: [],
      gameRoute: null,
      polylineAfter: null,
      distance: 0,
      looseWin: LooseWinEntity(reward: state.gameRoute?.reward),
      balance: (state.balance ?? 0) + event.balance,
      secondsWithTapsMap: {},
      lastTapWasSend: false,
      cameraPosition: CameraPosition(
        target: state.city?.location?.gmLatLng ?? state.cameraPosition.target,
        zoom: state.cameraPosition.zoom,
      ),
    ));
  }

  void _onTap(
    GameTapEvent event,
    Emitter<GameState> emit,
  ) {
    final newCount = tapCount + 1;
    final currentS = max(currentSecond - 1, 0);
    if ((state.gameRoute?.tapCount ?? 0) == newCount) {
      final lastSecondKeys = state.secondsWithTapsMap.keys
          .where((key) => key ~/ 10 == currentS)
          .toSet();
      int taps = 1;
      for (var key in lastSecondKeys) {
        taps += state.secondsWithTapsMap[key] ?? 0;
      }
      if (!state.lastTapWasSend) {
        _sendTap.call(
          currentSecond: currentSecond,
          tapCount: taps,
        );
        emit(state.copyWith(lastTapWasSend: true));
        print(
            "FFFFF last second: = $currentSecond, tapCount: = $taps, routeId: = ${state.gameRoute?.id}");
      }
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
    final gameSecond = secondsFromStart;
    Map<int, int> newMap = {...state.secondsWithTapsMap};
    if (state.secondsWithTapsMap.containsKey(gameSecond)) {
      newMap[gameSecond] = newMap[gameSecond]! + 1;
    } else {
      newMap[gameSecond] = 1;
    }
    emit(
      state.copyWith(
        distance: distance,
        markers: RouteMarker.getMarkers(
          entities: {
            MarkerEntity(
              markerId: MarkerType.finish.value,
              coordinate: moveRecords.$3.last,
              markerType: MarkerType.finish,
            ),
            MarkerEntity(
              markerId: MarkerType.driver.value,
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
        secondsWithTapsMap: newMap,
        cameraPosition: CameraPosition(
          target: moveRecords.$1,
          zoom: state.cameraPosition.zoom,
        ),
      ),
    );
  }

  void _updateSpeed(
    GameUpdateSpeedEvent event,
    Emitter<GameState> emit,
  ) {
    final passedSeconds = secondsFromStart;
    final (start, finish) =
        (max(passedSeconds - speedSecondsTime, 0), passedSeconds);
    final keysForInterval = state.secondsWithTapsMap.keys
        .where((key) => key >= start && key <= finish)
        .toList();
    var tapsForInterval = 0;
    for (var key in keysForInterval) {
      tapsForInterval += state.secondsWithTapsMap[key] ?? 0;
    }
    final intervalDiffer = finish - start;
    final speed = intervalDiffer > 10
        ? tapsForInterval * 10 / intervalDiffer
        : tapsForInterval;
    emit(state.copyWith(
      speed: speed,
      dseconds: event.seconds,
    ));
  }

  Set<MarkerEntity> markerEntities(List<DriveRouteEntity> routes) => routes
      .map((route) => route.markerEntity)
      .whereType<MarkerEntity>()
      .toSet();

  void timerCallback(Timer timer) {
    if (state.dseconds <= 0) {
      timer.cancel();
      return;
    } else {
      final dseconds = state.dseconds - _timerTick;

      final dsecondToFinish = dseconds % 10 == 0 ? dseconds : null;
      if (dsecondToFinish != null && !state.lastTapWasSend) {
        final secondsFromStart = clearGameDseconds - dsecondToFinish ~/ 10;
        final keys = state.secondsWithTapsMap.keys
            .where((key) => key ~/ 10 == secondsFromStart - 1)
            .toSet();
        final tapInTick = tapInTimerTick;
        if (keys.isNotEmpty || tapInTick != 0) {
          var tapCountBySecond = tapInTick;
          for (var key in keys) {
            tapCountBySecond += state.secondsWithTapsMap[key] ?? 0;
          }
          _sendTap.call(
            currentSecond: secondsFromStart,
            tapCount: tapCountBySecond,
          );
          print(
              "FFFFF second: = $secondsFromStart, tapCountBySecond: = $tapCountBySecond, tapCount: = $tapCount, total: = ${state.gameRoute?.tapCount}");
        }
      }
      add(GameUpdateSpeedEvent(seconds: dseconds));
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
    add(GamePrepareInfoEvent(
      city: userLocation!.city!,
      balance: event.balance,
    ));
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
      print("FFFFF second RewardEvent");
      add(GameWinEvent(balance: event.reward ?? 0));
    } else if (event is RouteCompletedFailedEvent) {
      print("FFFFF second RouteCompletedFailedEvent");
      add(const GameLooseEvent());
    }
  }

  Future<void> _addRoutes(
    GameAddRoutesEvent event,
    Emitter<GameState> emit,
  ) async {
    if (state.status == GameStateType.playing ||
        state.status == GameStateType.starting) {
      return;
    }
    await RouteMarker.preapareBitmaps();
    final markers = await RouteMarker.createMarkers(
      entities: markerEntities(event.routes),
      onTap: (routeId) => add(GameStartEvent(routeId)),
    );

    if (state.routes.isEmpty || state.status == GameStateType.loading) {
      emit(state.copyWith(
        status: GameStateType.initialized,
        routes: event.routes,
        markers: markers,
        cameraPosition: CameraPosition(
          target: event.routes.first.coordinatesList.first?.gmLatLng ??
              state.cameraPosition.target,
          zoom: state.cameraPosition.zoom,
        ),
      ));
      return;
    }
    if (state.routes.length == 3 &&
        !(state.routes.any((route) {
          final firstPoint = route.coordinatesListSafe.first;
          return firstPoint.latitude == state.cameraPosition.target.latitude &&
              firstPoint.longitude == state.cameraPosition.target.longitude;
        }))) {
      emit(state.copyWith(
        status: GameStateType.initialized,
        routes: event.routes,
        markers: markers,
        cameraPosition: CameraPosition(
          target: event.routes.first.coordinatesList.first?.gmLatLng ??
              state.cameraPosition.target,
          zoom: state.cameraPosition.zoom,
        ),
      ));
    }
    emit(state.copyWith(
      routes: event.routes,
      markers: markers,
    ));
  }

  @override
  Future<void> close() async {
    await _signalRSubscription.cancel();
    await _signalRService.disconnect();
    return super.close();
  }
}
