part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthLogoutEvent extends AuthEvent {}

final class AuthLoginByPasswordEvent extends AuthEvent {
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

final class AuthCheckEvent extends AuthEvent {}
