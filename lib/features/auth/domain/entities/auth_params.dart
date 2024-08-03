import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String login;
  final String password;

  const AuthParams({
    required this.login,
    required this.password,
  });

  @override
  List<Object?> get props => [
        login,
        password,
      ];
}
