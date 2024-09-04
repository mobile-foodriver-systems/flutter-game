part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeDataBeginEvent extends EditProfileEvent {
  final String email;

  const ChangeDataBeginEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class ConfirmChangeDataEvent extends EditProfileEvent {
  final String code;

  const ConfirmChangeDataEvent({required this.code});

  @override
  List<Object> get props => [code];
}
