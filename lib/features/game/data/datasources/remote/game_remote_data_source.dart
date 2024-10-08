import 'package:dio/dio.dart';
import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/services/locale_service/locale_service.dart';
import 'package:food_driver/core/services/signal_r/signal_r_service.dart';
import 'package:food_driver/features/game/data/models/game_action_result.dart';
import 'package:injectable/injectable.dart';

part 'game_remote_data_source_impl.dart';

abstract interface class GameRemoteDataSource {
  Future<Response<dynamic>> getUsersRatingList({
    int? radiusInKm,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  });

  Future<GameActionResult> startGame({required int cityId});

  void stopGame();

  Future<GameActionResult> takeRoute({required int routeId});

  Future<GameActionResult> cancelRoute();

  void moveOnRoute({required List<int> clickTimeList});
}
