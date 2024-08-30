part of 'raiting_bloc.dart';

sealed class RaitingEvent extends Equatable {
  const RaitingEvent();

  @override
  List<Object> get props => [];
}

class RaitingLoadEvent extends RaitingEvent {
  const RaitingLoadEvent({
    this.sort = UsersSortType.global,
    this.userId,
  });

  final UsersSortType sort;
  final int? userId;

  @override
  List<Object> get props => [
        sort,
        if (userId != null) userId!,
      ];
}
