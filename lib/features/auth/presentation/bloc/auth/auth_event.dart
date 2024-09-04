part of 'auth_bloc.dart';

final class AuthLogoutEvent extends AuthUserEvent {}

final class AuthLoginByPasswordEvent extends AuthUserEvent {
  final String login;
  final String password;

  const AuthLoginByPasswordEvent({
    required this.login,
    required this.password,
  });

  @override
  List<Object> get props => [
        login,
        password,
      ];
}

final class AuthCheckEvent extends AuthUserEvent {
  const AuthCheckEvent();

  @override
  List<Object> get props => [];
}

final class AuthDeleteEvent extends AuthUserEvent {}
