part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// final class _AuthStatusChanged extends AuthEvent {
//   const _AuthStatusChanged(this.status);

//   final AuthStatus status;
// }

final class AuthLogoutEvent extends AuthEvent {}

final class AuthLoginByPasswordEvent extends AuthEvent {
  final String login;
  final String password;

  const AuthLoginByPasswordEvent(
    this.login,
    this.password,
  );

  @override
  List<Object> get props => [
        login,
        password,
      ];
}

final class AuthCheckEvent extends AuthEvent {}
