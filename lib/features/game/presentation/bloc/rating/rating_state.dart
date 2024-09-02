part of 'rating_bloc.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState({
    @Default(ListStatus.initial) ListStatus status,
    @Default(UsersSortType.global) UsersSortType sort,
    @Default(null) RatingList? ratingList,
    @Default(null) Failure? error,
    @Default(0) int topOffset,
    @Default(0) int bottomOffset,
    @Default(false) bool isAllPrevLoaded,
    @Default(false) bool isAllNextLoaded,
    @Default(false) bool nextItemsLoading,
    @Default(false) bool prevItemsLoading,
    @Default(false) bool dataInitialized,
  }) = _RatingState;
}

extension on _$RatingState {
  bool isAllLoaded(Direction direction) =>
      direction.isDown ? isAllNextLoaded : isAllPrevLoaded;
}
