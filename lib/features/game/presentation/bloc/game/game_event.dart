part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

final class GamePrepareInfoEvent extends GameEvent {
  const GamePrepareInfoEvent(this.cityId);

  final int cityId;

  @override
  List<Object> get props => [];
}

final class GameStartEvent extends GameEvent {
  const GameStartEvent(this.routeId);

  final int routeId;

  @override
  List<Object> get props => [routeId];
}

final class GamePlayEvent extends GameEvent {
  const GamePlayEvent();

  @override
  List<Object> get props => [];
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

final class GameLooseEvent extends GameEvent {
  const GameLooseEvent();

  @override
  List<Object> get props => [];
}

final class GameWinEvent extends GameEvent {
  const GameWinEvent();

  @override
  List<Object> get props => [];
}

final class GameTapEvent extends GameEvent {
  const GameTapEvent();

  @override
  List<Object> get props => [];
}

final class GameUpdateSpeedEvent extends GameEvent {
  final int seconds;
  const GameUpdateSpeedEvent({
    required this.seconds,
  });

  @override
  List<Object> get props => [seconds];
}
