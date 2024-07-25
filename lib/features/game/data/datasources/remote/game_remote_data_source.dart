import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:food_driver/features/game/data/models/user_rating.dart';

abstract interface class GameRemoteDataSource {
  Future<List<UserRating>> getUsersRatingList();

  Future<List<DriveRoute>> getUsersRoutesList();
}
