import 'package:food_driver/core/interceptors/auth_interceptor.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/features/game/data_source/remote/game_remote_data_source.dart';
import 'package:food_driver/features/game/models/game_route.dart';
import 'package:food_driver/features/game/models/lat_lng.dart';
import 'package:food_driver/features/game/models/user_rating.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(
  as: GameRemoteDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class GameRemoteDataSourceImpl implements GameRemoteDataSource {
  final AppHttpService _appHttpService;

  GameRemoteDataSourceImpl(
    this._appHttpService,
  ) {
    _appHttpService.interceptors.add(AuthInterceptor());
  }

  @override
  Future<List<UserRating>> getUsersRatingList() async {
    // final response = await _appHttpService.request(
    //   path: '',
    //   type: RequestType.get,
    // );
    // return (response.data as List)
    //     .map((i) => UserRating.fromJson(jsonDecode(i)))
    //     .toList();
    return [
      const UserRating(name: "One", position: 1),
      const UserRating(name: "Two", position: 2),
      const UserRating(name: "Three", position: 3),
      const UserRating(name: "Four", position: 4),
      const UserRating(name: "Five", position: 5),
      const UserRating(name: "Six", position: 6),
      const UserRating(name: "Seven", position: 7),
      const UserRating(name: "Eight", position: 8),
      const UserRating(name: "Nine", position: 9),
      const UserRating(name: "Ten", position: 10),
    ];
  }

  @override
  Future<List<GameRoute>> getUsersRoutesList() async {
    // final response = await _appHttpService.request(
    //   path: '',
    //   type: RequestType.get,
    // );
    // return (response.data as List)
    //     .map((i) => GameRoute.fromJson(jsonDecode(i)))
    //     .toList();
    return [
      GameRoute(
        points: [
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
        seconds: 60,
        tapCount: 180,
        reward: 0.02,
      ),
      GameRoute(
        points: [
          LatLng(55.72151179791592, 37.61625688053631),
          LatLng(55.72126000637394,37.616365572690505),
          LatLng(55.72134076272254,37.617006393454886),
          LatLng(55.721374068483115,37.61708954193435),
          LatLng(55.72141797148757,37.61739263155302),
          LatLng(55.723351925344836,37.616740854762405),
          LatLng(55.723485141325945,37.616644295237876),
          LatLng(55.72756594641373,37.61484081811778),
          LatLng(55.72763740424775,37.61181256007577),
          LatLng(55.72802641130683,37.61187693309214),
        ],
        seconds: 45,
        tapCount: 250,
        reward: 0.4,
      ),
    ];
  }
}
