import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/game/data/datasources/remote/game_remote_data_source.dart';
import 'package:food_driver/features/game/data/models/game_action_result.dart';
import 'package:food_driver/features/game/data/models/rating_list.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:food_driver/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/game/data/repositories/game_repository_impl.dart';

abstract class GameRepository {
  Future<Either<ApiErrorStack, RatingList>> loadRatingList({
    int? radiusInKm,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  });

  Future<Either<Failure, GameActionResult>> startGame({required int cityId});

  void stopGame();

  Future<Either<Failure, GameActionResult>> takeRoute({required int routeId});

  Future<Either<Failure, GameActionResult>> cancelRoute();

  void moveOnRoute({required List<int> clickTimeList});
}
