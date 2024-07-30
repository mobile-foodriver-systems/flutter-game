part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class UserLoadProfileEvent extends UserEvent {
  const UserLoadProfileEvent();

  @override
  List<Object> get props => [];
}
