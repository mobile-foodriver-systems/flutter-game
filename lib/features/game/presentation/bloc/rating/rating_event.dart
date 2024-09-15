part of 'rating_bloc.dart';

sealed class RatingEvent extends Equatable {
  const RatingEvent();

  @override
  List<Object> get props => [];
}

class RatingLoadEvent extends RatingEvent {
  const RatingLoadEvent({
    required this.sort,
    this.direction = Direction.down,
  });

  final UsersSortType sort;
  final Direction direction;

  @override
  List<Object> get props => [
        sort,
        direction,
      ];
}

class RatingInitEvent extends RatingEvent {
  const RatingInitEvent({
    this.sort = UsersSortType.global,
    this.userId,
    this.initializedCallback,
  });

  final UsersSortType sort;
  final int? userId;
  final Future Function()? initializedCallback;

  @override
  List<Object> get props => [
        sort,
        if (userId != null) userId!,
      ];
}

class RatingReloadEvent extends RatingEvent {
  const RatingReloadEvent({
    required this.sort,
    this.city,
  });

  final UsersSortType sort;
  final City? city;

  @override
  List<Object> get props => [
        sort,
        if (city != null) city!,
      ];
}

class LoadProfileEvent extends RatingEvent {
  const LoadProfileEvent();

  @override
  List<Object> get props => [];
}

class SwitchSortTypeEvent extends RatingEvent {
  const SwitchSortTypeEvent({
    required this.sort,
  });

  final UsersSortType sort;

  @override
  List<Object> get props => [];
}
