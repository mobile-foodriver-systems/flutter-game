part of 'raiting_bloc.dart';

@freezed
class RaitingState with _$RaitingState {
  const factory RaitingState({
    @Default(ListStatus.initial) ListStatus status,
    @Default(UsersSortType.global) UsersSortType sort,
    @Default(null) RaitingList? raitingList,
    @Default(null) Failure? error,
    @Default(null) int? position,
  }) = _RaitingState;
}
