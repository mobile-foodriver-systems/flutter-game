part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(GameStateType.loading) GameStateType status,
    @Default(null) City? city,
    @Default([]) List<DriveRouteEntity> routes,
    @Default(null) DriveRouteEntity? gameRoute,
    @Default({}) Set<Marker> markers,
    @Default({}) Set<Polyline> polylines,
    @Default(null) Timer? timer,
    @Default(0) num speed,
    @Default(0) int dseconds,
    @Default(null) num? balance,
    @Default(null) LooseWinEntity? looseWin,
    @Default(0) double distance,
    @Default(null) Polyline? polylineAfter,
    @Default({}) Map<int, int> secondsWithTapsMap,
  }) = _GameState;
}
