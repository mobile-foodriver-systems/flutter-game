import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    this.accessToken,
    this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;

  AuthEntity copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}
