import 'package:dio/dio.dart';
import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:food_driver/features/game/data/models/lat_lng.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:injectable/injectable.dart';

part 'game_remote_data_source_impl.dart';

abstract interface class GameRemoteDataSource {
  Future<Response<dynamic>> getUsersRatingList({
    int? radiusInKm,
    int limit = 20,
    int offset = 0,
  });

  Future<List<DriveRoute>> getDriveRoutesList({required int cityId});
}
