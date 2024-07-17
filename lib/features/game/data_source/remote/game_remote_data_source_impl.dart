import 'package:food_driver/core/interceptors/auth_interceptor.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/features/game/data_source/remote/game_remote_data_source.dart';
import 'package:food_driver/features/game/models/game_route.dart';
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
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
    );
    return response.data.fromJson();
  }

  @override
  Future<List<GameRoute>> getUsersRoutesList() async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
    );
    return response.data.fromJson();
  }
}
