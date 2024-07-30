import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/city.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/domain/entities/route_marker.dart';
import 'package:food_driver/features/game/domain/usecases/load.dart';
import 'package:food_driver/features/game/domain/usecases/play.dart';
import 'package:food_driver/features/game/domain/usecases/start.dart';
import 'package:food_driver/features/game/domain/usecases/stop.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  final LoadUseCase _load;
  final StartUseCase _start;
  final PlayUseCase _play;
  final StopUseCase _stop;
  GameBloc(
    this._load,
    this._start,
    this._play,
    this._stop,
  ) : super(const GameState()) {
    on<GameChangeStateTypeEvent>(_changeGameState);
    on<GamePrepareInfoEvent>(_prepareInfo);
    on<GameStartEvent>(_startGame);
    on<GameAddMarkersEvent>(_addMarkers);
    on<GameAddPolylinesEvent>(_addPolylines);
    on<GameBreakEvent>(_breakGame);
    on<GameInitializedEvent>(_initializedGame);
    on<GameLooseEvent>(_looseGame);
  }

  void _changeGameState(
    GameChangeStateTypeEvent event,
    Emitter<GameState> emit,
  ) {
    switch (event.status) {
      case GameStateType.error:
      case GameStateType.loading:
      case GameStateType.initialized:
      case GameStateType.starting:
      // _start(NoParams());
      case GameStateType.playing:
      // _play(NoParams());
      case GameStateType.win:
      case GameStateType.loose:
    }
    emit(state.copyWith(status: event.status));
  }

  void _prepareInfo(
    GamePrepareInfoEvent event,
    Emitter<GameState> emit,
  ) async {
    final response = await _load.call(event.cityId);
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
    emit(state.copyWith(
      status: GameStateType.starting,
      gameRoute: event.route,
      markers: {},
      polylines: {
        Polyline(
          polylineId: PolylineId(event.route.id.toString()),
          points: event.route.points,
          color: AppColors.black,
          width: 1,
        ),
      },
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
    final markers = await _updatedMarkers();
    emit(state.copyWith(
      status: GameStateType.initialized,
      polylines: {},
      markers: markers,
    ));
  }

  void _initializedGame(
    GameInitializedEvent event,
    Emitter<GameState> emit,
  ) async {
    final markers = await RouteMarker.createMarkers(
      routes: state.routes,
      onTap: (route) => add(GameStartEvent(route)),
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
    final markers = await _updatedMarkers();
    emit(state.copyWith(
      status: GameStateType.loose,
      polylines: {},
      markers: markers,
    ));
  }

  Future<Set<Marker>> _updatedMarkers() async {
    var routes = [...state.routes];
    routes.removeWhere((route) => route.id == state.gameRoute?.id);
    return await RouteMarker.createMarkers(
      routes: routes,
      onTap: (route) => add(GameStartEvent(route)),
    );
  }
}
