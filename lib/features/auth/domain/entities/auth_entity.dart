import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.tokenType,
    this.scope,
  });

  final String? accessToken;
  final String? refreshToken;
  final int? expiresIn;
  final String? tokenType;
  final String? scope;

  AuthEntity copyWith({
    String? accessToken,
    String? refreshToken,
    int? expiresIn,
    String? tokenType,
    String? scope,
  }) {
    return AuthEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresIn: expiresIn,
      tokenType: tokenType,
      scope: scope,
    );
  }

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        expiresIn,
        tokenType,
        scope,
      ];

  bool get isEmpty =>
      (accessToken?.isEmpty ?? true) && (refreshToken?.isEmpty ?? true);

  bool get isNotEmpty => !isEmpty;
}
