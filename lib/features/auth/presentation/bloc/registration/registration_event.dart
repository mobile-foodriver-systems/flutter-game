part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

final class AuthRegistrationEvent extends RegistrationEvent {
  const AuthRegistrationEvent({
    required this.login,
    required this.password,
    required this.doLogin,
  });

  final String login;
  final String password;
  final VoidCallback doLogin;

  @override
  List<Object> get props => [
        login,
        password,
        doLogin,
      ];
}
