part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(GameStateType.loading) GameStateType status,
    @Default(null) City? cityId,
  }) = _GameState;
}
