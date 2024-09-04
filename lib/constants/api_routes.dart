class ApiRoutes {
  // Auth
  static const String token = '/identity/connect/token';

  // User
  static const String account = '/game/api/v1/account';
  static const String profile = '/game/api/v1/account/my';
  static const String updateLocation = '/game/api/v1/account/location';
  static const String rating = '/game/api/v1/rating';
  static const String recoveryPassword =
      '/game/api/v1/account/password/change/by_email/begin';
  static const String confirmPasswordRecovery =
      '/game/api/v1/account/password/change/by_email/complete';
  static const String getConfirmationCode =
      '/game/api/v1/account/email/change/begin';
  static const String sendConfirmationCode =
      '/game/api/v1/account/email/change/complete';

  // Game
  static const String routes = '/game/api/v1/osmroute/random/by_city';

  // Location
  static const String countries = '/game/api/v1/osmcountry';
  static const String cities = '/game/api/v1/osmcity';
  static const String cityByLatLng = '/game/api/v1/osmcity/by_location';

  // Localization
  static const String localization = '/game/api/v1/localization';

  // SignalR
  static const String signalR = '/game/SignalR/v1/game';
}
