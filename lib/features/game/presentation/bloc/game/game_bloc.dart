import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/domain/entities/marker_entity.dart';
import 'package:food_driver/features/game/domain/entities/route_marker.dart';
import 'package:food_driver/features/game/domain/usecases/load.dart';
import 'package:food_driver/features/game/domain/usecases/play.dart';
import 'package:food_driver/features/game/domain/usecases/start.dart';
import 'package:food_driver/features/game/domain/usecases/stop.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/domain/usecases/city_by_lat_lng.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
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
  final PlayUseCase _play;
  final StopUseCase _stop;
  GameBloc(
    this._load,
    this._start,
    this._play,
    this._stop,
    this._userLocationByLatLng,
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
  }

  Set<MarkerEntity> get markerEntities => state.routes
      .map((route) => route.markerEntity)
      .whereType<MarkerEntity>()
      .toSet();

  void _prepareInfo(
    GamePrepareInfoEvent event,
    Emitter<GameState> emit,
  ) async {
    final response = await _load.call(event.city.id);
    response.fold(
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
    final (routes, markers) = await _updatedMarkers();
    emit(state.copyWith(
      status: GameStateType.initialized,
      polylines: {},
      markers: markers,
      routes: routes,
    ));
  }

  void _initializedGame(
    GameInitializedEvent event,
    Emitter<GameState> emit,
  ) async {
    final markers = await RouteMarker.createMarkers(
      entities: markerEntities,
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
    final (routes, markers) = await _updatedMarkers();
    emit(state.copyWith(
      status: GameStateType.loose,
      polylines: {},
      timer: null,
      markers: markers,
      routes: routes,
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
    ));
  }

  void _onTap(
    GameTapEvent event,
    Emitter<GameState> emit,
  ) {
    final newCount = state.tapCount + 1;
    if ((state.gameRoute?.tapCount ?? 0) == newCount) {
      add(const GameWinEvent());
      return;
    }
    emit(state.copyWith(
      tapCount: newCount,
    ));
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
    ));
  }

  Future<(List<DriveRouteEntity>, Set<Marker>)> _updatedMarkers() async {
    var routes = [...state.routes];
    routes.removeWhere((route) => route.id == state.gameRoute?.id);
    final markers = await RouteMarker.createMarkers(
      entities: markerEntities,
      onTap: (routeId) => add(GameStartEvent(routeId)),
    );
    return (routes, markers);
  }

  void timerCallback(Timer timer) {
    if (state.seconds == 0) {
      timer.cancel();
      add(const GameLooseEvent());
      return;
    } else {
      add(GameUpdateSpeedEvent(seconds: max(state.seconds - 1, 0)));
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
    response.fold(
      (error) {
        emit(state.copyWith(status: GameStateType.error));
      },
      (result) {
        if (result.city?.id != null) {
          add(GamePrepareInfoEvent(result.city!));
          return;
        }
        emit(state.copyWith(status: GameStateType.error));
      },
    );
  }
}
