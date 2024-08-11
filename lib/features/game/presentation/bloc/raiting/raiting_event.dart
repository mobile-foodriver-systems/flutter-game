part of 'raiting_bloc.dart';

sealed class RaitingEvent extends Equatable {
  const RaitingEvent();

  @override
  List<Object> get props => [];
}

class RaitingLoadEvent extends RaitingEvent {
  const RaitingLoadEvent({this.sort = UsersSortType.global});

  final UsersSortType sort;

  @override
  List<Object> get props => [sort];
}
