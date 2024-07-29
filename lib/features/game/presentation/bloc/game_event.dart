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
