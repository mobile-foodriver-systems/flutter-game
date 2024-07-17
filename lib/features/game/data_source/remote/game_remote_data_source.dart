import 'package:food_driver/features/game/models/game_route.dart';
import 'package:food_driver/features/game/models/user_rating.dart';

abstract interface class GameRemoteDataSource {
  Future<List<UserRating>> getUsersRatingList();

  Future<List<GameRoute>> getUsersRoutesList();
}
