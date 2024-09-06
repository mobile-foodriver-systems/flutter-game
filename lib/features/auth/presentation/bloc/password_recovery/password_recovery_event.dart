part of 'password_recovery_bloc.dart';

abstract class PasswordRecoveryEvent extends Equatable {
  const PasswordRecoveryEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordBeginEvent extends PasswordRecoveryEvent {
  final String email;
  final String newPassword;

  const ChangePasswordBeginEvent({
    required this.email,
    required this.newPassword,
  });

  @override
  List<Object> get props => [
        email,
        newPassword,
      ];
}

class ConfirmPasswordChangeEvent extends PasswordRecoveryEvent {
  final String email;
  final String code;

  const ConfirmPasswordChangeEvent({
    required this.email,
    required this.code,
  });

  @override
  List<Object> get props => [
        email,
        code,
      ];
}
