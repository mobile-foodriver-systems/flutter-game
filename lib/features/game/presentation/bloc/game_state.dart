part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(GameStateType.loading) GameStateType status,
    @Default(null) City? cityId,
    @Default([]) List<DriveRouteEntity> routes,
    @Default(null) DriveRouteEntity? gameRoute,
    @Default({}) Set<Marker> markers,
    @Default({}) Set<Polyline> polylines,
  }) = _GameState;
}
