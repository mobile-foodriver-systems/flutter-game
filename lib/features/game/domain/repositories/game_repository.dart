import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/game/data/datasources/remote/game_remote_data_source.dart';
import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/game/data/repositories/game_repository_impl.dart';

abstract class GameRepository {
  Future<Either<Failure, List<DriveRouteEntity>>> loadDriveRoutes({required int cityId});
}
