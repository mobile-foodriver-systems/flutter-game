part of 'rating_bloc.dart';

sealed class RatingEvent extends Equatable {
  const RatingEvent();

  @override
  List<Object> get props => [];
}

class RatingLoadEvent extends RatingEvent {
  const RatingLoadEvent({
    this.sort = UsersSortType.global,
    this.userId,
    this.direction = Direction.down,
  });

  final UsersSortType sort;
  final int? userId;
  final Direction direction;

  @override
  List<Object> get props => [
        sort,
        if (userId != null) userId!,
      ];
}


class RatingInitEvent extends RatingEvent {
  const RatingInitEvent({
    this.sort = UsersSortType.global,
    this.userId,
    required this.initializedCallback,
  });

  final UsersSortType sort;
  final int? userId;
  final VoidCallback initializedCallback;

  @override
  List<Object> get props => [
        sort,
        if (userId != null) userId!,
      ];
}
