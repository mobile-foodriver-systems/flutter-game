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
    this.startLoad = true,
  });

  final UsersSortType sort;
  final City? city;
  final bool startLoad;

  @override
  List<Object> get props => [
        sort,
        if (city != null) city!,
        startLoad,
      ];
}

class LoadProfileEvent extends RatingEvent {
  const LoadProfileEvent();

  @override
  List<Object> get props => [];
}

class SwitchSortTypeEvent extends RatingEvent {
  final UsersSortType sort;
  const SwitchSortTypeEvent({
    required this.sort,
  });

  @override
  List<Object> get props => [sort];
}

class IsLoadingEvent extends RatingEvent {
  final UsersSortType sort;
  const IsLoadingEvent({
    required this.sort,
  });

  @override
  List<Object> get props => [sort];
}
