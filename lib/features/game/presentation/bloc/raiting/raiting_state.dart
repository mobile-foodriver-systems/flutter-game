part of 'raiting_bloc.dart';

@freezed
class RaitingState with _$RaitingState {
  const factory RaitingState({
    @Default(RaitingStateType.loading) RaitingStateType status,
    @Default(UsersSortType.global) UsersSortType sort,
    @Default(null) RaitingList? raitingList,
    @Default(null) Failure? error,
  }) = _RaitingState;
}
