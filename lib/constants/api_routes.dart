class ApiRoutes {
  // Auth
  static const String token = '/identity/connect/token';

  // User
  static const String registration = '/game/api/v1/account';
  static const String profile = '/game/api/v1/account/my';
  static const String updateProfile = '/game/api/v1/account/{id}';
  static const String updateLocation = '/game/api/v1/account/{id}/location';
  static const String rating = '/game/api/v1/rating';

  // Game
  static const String routes = '/game/api/v1/osmroute/random/by_city';

  // Location
  static const String countries = '/game/api/v1/osmcountry';
  static const String cities = '/game/api/v1/osmcity';
  static const String cityByLatLng = '/game/api/v1/osmcity/by_location';

  // Localization
  static const String localization = '/game/api/v1/localization';
}
