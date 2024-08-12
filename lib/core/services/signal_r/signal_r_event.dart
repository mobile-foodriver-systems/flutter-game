part of 'package:food_driver/core/services/signal_r/signal_r_service.dart';

@immutable
sealed class SignalREvent {}

final class AddRoutesEvent implements SignalREvent {
  const AddRoutesEvent({required this.routes});

  final List<DriveRoute> routes;
}

final class RewardEvent implements SignalREvent {
  const RewardEvent({required this.reward});

  final num? reward;
}

final class RouteCompletedFailedEvent implements SignalREvent {
  const RouteCompletedFailedEvent();
}
