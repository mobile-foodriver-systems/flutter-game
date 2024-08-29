import 'package:dio/dio.dart';
import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/services/signal_r/signal_r_service.dart';
import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:food_driver/features/game/data/models/game_action_result.dart';
import 'package:food_driver/features/game/data/models/lat_lng.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:injectable/injectable.dart';

part 'game_remote_data_source_impl.dart';

abstract interface class GameRemoteDataSource {
  Future<Response<dynamic>> getUsersRatingList({
    int? radiusInKm,
    int? limit,
    int? offset,
  });

  @Deprecated('Not used. Now all game methods calls in SignalR')
  Future<List<DriveRoute>> getDriveRoutesList({required int cityId});

  Future<GameActionResult> startGame({required int cityId});

  void stopGame();

  Future<GameActionResult> takeRoute({required int routeId});

  Future<GameActionResult> cancelRoute();

  void moveOnRoute({required List<int> clickTimeList});
}
