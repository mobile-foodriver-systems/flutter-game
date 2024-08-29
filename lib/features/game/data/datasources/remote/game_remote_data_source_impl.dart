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

  GameRemoteDataSourceImpl(
    this._appHttpService,
    this._appSignalRService,
  );

  @override
  Future<Response<dynamic>> getUsersRatingList({
    int? radiusInKm,
    int? limit,
    int? offset,
  }) async {
    return await _appHttpService.request(
        path: ApiRoutes.rating,
        type: RequestType.get,
        queryParameters: {
          if (radiusInKm != null) "radiusInKm": radiusInKm,
          if (limit != null) "limit": limit,
          if (offset != null) "offset": offset,
        });
  }

  @override
  Future<List<DriveRoute>> getDriveRoutesList({required int cityId}) async {
    // final response = await _appHttpService.request(
    //   path: ApiRoutes.routes,
    //   type: RequestType.get,
    // );
    // return (response.data as List)
    //     .map((i) => GameRoute.fromJson(jsonDecode(i)))
    //     .toList();
    return [
      DriveRoute(
        id: 1,
        city: City(
          id: 65345,
          name: "Pécs",
          countryId: 963,
        ),
        coordinateList: [
          LatLng(55.71956193730124, 37.61345092255401),
          LatLng(55.719564965237346, 37.613633312767035),
          LatLng(55.7166586047333, 37.61360425287878),
          LatLng(55.71672673832446, 37.60859071151155),
          LatLng(55.71671159753675, 37.60829566851993),
          LatLng(55.716720682010084, 37.60817765132327),
          LatLng(55.71572748422479, 37.607783393453154),
          LatLng(55.71566086300319, 37.60757418114999),
          LatLng(55.71606058862121, 37.60574491460185),
          LatLng(55.71613326556496, 37.60583074529032),
          LatLng(55.71638763379866, 37.60601313550332),
          LatLng(55.716417915620426, 37.6061150594459),
          LatLng(55.71655115535615, 37.60621698338845),
        ],
        timeForDistance: 10,
        clickCountForDistance: 50,
        fdtForDistance: 0.02,
      ),
      DriveRoute(
        id: 2,
        city: City(
          id: 65345,
          name: "Pécs",
          countryId: 963,
        ),
        coordinateList: [
          LatLng(55.72151179791592, 37.61625688053631),
          LatLng(55.72126000637394, 37.616365572690505),
          LatLng(55.72134076272254, 37.617006393454886),
          LatLng(55.721374068483115, 37.61708954193435),
          LatLng(55.72141797148757, 37.61739263155302),
          LatLng(55.723351925344836, 37.616740854762405),
          LatLng(55.723485141325945, 37.616644295237876),
          LatLng(55.72756594641373, 37.61484081811778),
          LatLng(55.72763740424775, 37.61181256007577),
          LatLng(55.72802641130683, 37.61187693309214),
        ],
        timeForDistance: 15,
        clickCountForDistance: 250,
        fdtForDistance: 0.4,
      ),
    ];
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
