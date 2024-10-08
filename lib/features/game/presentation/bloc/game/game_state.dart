part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.loading() = _Loading;
  const factory GameState.error({
    required Failure error,
  }) = _Error;
  const factory GameState.noCity() = _NoCity;
  const factory GameState.initialized({
    required City city,
    required num balance,
    @Default([]) List<DriveRouteEntity> routes,
    @Default({}) Set<Marker> markers,
    @Default(CameraPosition(
      target: GameBloc._defaultPosition,
      zoom: GameBloc._defaultZoom,
    ))
    CameraPosition cameraPosition,
  }) = _Initialized;
  const factory GameState.game({
    @Default(GameStateType.starting) GameStateType status,
    required City city,
    required num balance,
    required DriveRouteEntity gameRoute,
    @Default({}) Set<Marker> markers,
    @Default({}) Set<Polyline> polylines,
    @Default(null) Timer? timer,
    @Default(0) num speed,
    @Default(0) int dseconds,
    @Default(null) LooseWinEntity? looseWin,
    @Default(0) double distance,
    @Default(null) Polyline? polylineAfter,
    @Default({}) Map<int, int> secondsWithTapsMap,
    @Default(false) bool lastTapWasSend,
    @Default(CameraPosition(
      target: GameBloc._defaultPosition,
      zoom: GameBloc._defaultZoom,
    ))
    CameraPosition cameraPosition,
  }) = _Game;
}
