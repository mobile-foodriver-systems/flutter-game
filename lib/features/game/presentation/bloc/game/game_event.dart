part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

final class GetRoutesEvent extends GameEvent {
  const GetRoutesEvent({
    required this.city,
    required this.balance,
  });

  final City city;
  final num balance;

  @override
  List<Object> get props => [
        city,
        balance,
      ];
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
  const GameWinEvent({
    required this.balance,
  });

  final num balance;

  @override
  List<Object> get props => [balance];
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
  List<Object> get props => [
        seconds,
      ];
}

final class GetCityEvent extends GameEvent {
  const GetCityEvent({
    required this.latLng,
    required this.balance,
    this.updateCity,
  });

  final LatLng latLng;
  final num balance;
  final void Function(City)? updateCity;
  @override
  List<Object> get props => [
        latLng,
        if (updateCity != null) updateCity!,
        balance,
      ];
}

final class GameNoCityEvent extends GameEvent {
  const GameNoCityEvent();

  @override
  List<Object> get props => [];
}

final class GameAddRoutesEvent extends GameEvent {
  const GameAddRoutesEvent({
    required this.routes,
  });

  final List<DriveRouteEntity> routes;

  @override
  List<Object> get props => [routes];
}
