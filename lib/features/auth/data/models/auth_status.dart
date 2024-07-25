enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated;
}

extension AuthStatusX on AuthStatus {
  bool get isAuthenticated => this == AuthStatus.authenticated;

  bool get isUnauthenticated => this == AuthStatus.unauthenticated;

  bool get isUnknown => this == AuthStatus.unknown;
}
