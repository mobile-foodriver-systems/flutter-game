part of 'rating_bloc.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState({
    @Default(ListStatus.initial) ListStatus status,
    @Default(UsersSortType.global) UsersSortType sort,
    @Default(null) RatingList? ratingList,
    @Default(null) Failure? error,
    @Default(null) int? topOffset,
    @Default(null) int? bottomOffset,
    @Default(false) bool isAllPrevLoaded,
    @Default(false) bool isAllNextLoaded,
    @Default(false) bool nextItemsLoading,
    @Default(false) bool prevItemsLoading,
    @Default(false) bool dataInitialized,
    @Default(null) UserRating? position,
    @Default(null) int? userId,
    @Default(null) UserEntity? user,
  }) = _RatingState;
}

extension on _$RatingState {
  bool isAllLoaded(Direction direction) =>
      direction.isDown ? isAllNextLoaded : isAllPrevLoaded;

  int offset(Direction direction) =>
      direction == Direction.up ? (topOffset ?? 0) : (bottomOffset ?? 0);

  double? long(UsersSortType? sort) =>
      (sort ?? this.sort) == UsersSortType.global
          ? null
          : user?.city?.location?.longitude;

  double? lat(UsersSortType? sort) =>
      (sort ?? this.sort) == UsersSortType.global
          ? null
          : user?.city?.location?.latitude;

  bool isLoading(Direction direction) =>
      direction.isDown ? nextItemsLoading : prevItemsLoading;
}
