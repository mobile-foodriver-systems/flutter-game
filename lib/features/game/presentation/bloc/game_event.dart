part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

final class GameChangeStateTypeEvent extends GameEvent {
  final GameStateType status;
  const GameChangeStateTypeEvent(this.status);

  @override
  List<Object> get props => [status];
}

final class GamePrepareInfoEvent extends GameEvent {
  const GamePrepareInfoEvent(this.cityId);

  final int cityId;

  @override
  List<Object> get props => [];
}

final class GameStartEvent extends GameEvent {
  const GameStartEvent(this.route);

  final DriveRouteEntity route;

  @override
  List<Object> get props => [route];
}

final class GameAddMarkersEvent extends GameEvent {
  const GameAddMarkersEvent(this.markers);

  final Set<Marker> markers;

  @override
  List<Object> get props => [markers];
}

final class GameAddPolylinesEvent extends GameEvent {
  const GameAddPolylinesEvent(this.polylines);

  final Set<Polyline> polylines;

  @override
  List<Object> get props => [polylines];
}

final class GameBreakEvent extends GameEvent {
  const GameBreakEvent();

  @override
  List<Object> get props => [];
}

final class GameInitializedEvent extends GameEvent {
  const GameInitializedEvent();
  
  @override
  List<Object> get props => [];
}
