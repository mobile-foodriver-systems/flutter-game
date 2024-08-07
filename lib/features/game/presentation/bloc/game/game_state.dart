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
    @Default(0) int tapCount,
    @Default(null) Timer? timer,
    @Default(0) num speed,
    @Default(0) int seconds,
    @Default(null) UserEntity? user,
  }) = _GameState;
}
