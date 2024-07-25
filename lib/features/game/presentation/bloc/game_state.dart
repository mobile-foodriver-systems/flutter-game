part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(GameStateType.init) GameStateType status,
  }) = _GameState;
}
