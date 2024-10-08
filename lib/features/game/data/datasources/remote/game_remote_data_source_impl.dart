part of "game_remote_data_source.dart";

@LazySingleton(
  as: GameRemoteDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class GameRemoteDataSourceImpl implements GameRemoteDataSource {
  final AppHttpService _appHttpService;
  final AppSignalRService _appSignalRService;
  final LocaleService _localeService;

  GameRemoteDataSourceImpl(
    this._appHttpService,
    this._appSignalRService,
    this._localeService,
  );

  @override
  Future<Response<dynamic>> getUsersRatingList({
    int? radiusInKm,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  }) async {
    return await _appHttpService.request(
        path: ApiRoutes.rating,
        type: RequestType.get,
        queryParameters: {
          if (radiusInKm != null) "radiusInKm": radiusInKm,
          if (latitude != null) "latitude": latitude,
          if (longitude != null) "longitude": longitude,
          if (limit != null) "limit": limit,
          if (offset != null) "offset": offset,
          "culture": _localeService.languageCode,
        });
  }

  @override
  void moveOnRoute({required List<int> clickTimeList}) {
    _appSignalRService.invoke(
      methodName: 'MoveOnRoute',
      args: [
        {"clickTimeList": clickTimeList}
      ],
    );
  }

  @override
  Future<GameActionResult> startGame({required int cityId}) async {
    final response = await _appSignalRService.invoke(
      methodName: 'StartGame',
      args: [
        {"osmCityId": cityId},
      ],
    );
    return GameActionResult.fromJson(response as Map<String, dynamic>);
  }

  @override
  void stopGame() {
    _appSignalRService.invoke(methodName: 'StopGame');
  }

  @override
  Future<GameActionResult> takeRoute({required int routeId}) async {
    final response = await _appSignalRService.invoke(
      methodName: 'TakeRoute',
      args: [
        {"osmRouteId": routeId}
      ],
    );
    return GameActionResult.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<GameActionResult> cancelRoute() async {
    final response = await _appSignalRService.invoke(
      methodName: 'CancelRoute',
    );
    return GameActionResult.fromJson(response as Map<String, dynamic>);
  }
}
