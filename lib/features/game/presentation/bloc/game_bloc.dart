import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/usecases/play.dart';
import 'package:food_driver/features/game/domain/usecases/start.dart';
import 'package:food_driver/features/game/domain/usecases/stop.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  final StartUseCase _start;
  final PlayUseCase _play;
  final StopUseCase _stop;
  GameBloc(
    this._start,
    this._play,
    this._stop,
  ) : super(const GameState()) {
    on<GameChangeStateTypeEvent>(_changeGameState);
  }

  void _changeGameState(
    GameChangeStateTypeEvent event,
    Emitter<GameState> emit,
  ) {
    switch (event.status) {
      case GameStateType.init:
      case GameStateType.starting:
        _start(NoParams());
      case GameStateType.playing:
        _play(NoParams());
      case GameStateType.win:
      case GameStateType.loose:
    }
    emit(state.copyWith(status: event.status));
  }
}
