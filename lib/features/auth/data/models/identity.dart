enum GrantType {
  clientCredentials,
  password,
  refreshToken;

  String get value {
    switch (this) {
      case GrantType.clientCredentials:
        return 'client_credentials';
      case GrantType.password:
        return 'password';
      case GrantType.refreshToken:
        return 'refresh_token';
    }
  }
}

class Identity {
  final String clientId;
  final String clientSecret;
  final String? scope;
  final GrantType grantType;

  const Identity({
    this.clientId = 'foodriver.game.api.client',
    this.clientSecret = 'R2#L\$8*X+6!M^3&d9pW7@Q%v4zA1B+K',
    this.scope,
    required this.grantType,
  });

  Map<String, dynamic> toMap() {
    return {
      'client_id': clientId,
      'client_secret': clientSecret,
      if (scope?.isNotEmpty ?? false) 'scope': scope,
      'grant_type': grantType.value,
    };
  }
}
