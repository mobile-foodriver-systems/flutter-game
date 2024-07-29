part of 'package:food_driver/features/game/domain/repositories/game_repository.dart';

@LazySingleton(
  as: GameRepository,
  env: [Environment.prod, Environment.dev],
)
class GameRepositoryImpl extends GameRepository {
  GameRepositoryImpl(this._remoteDataSource);

  final GameRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<DriveRouteEntity>>> loadDriveRoutes(
      {required int cityId}) async {
    try {
      final response =
          await _remoteDataSource.getDriveRoutesList(cityId: cityId);
      return Right(response.map((route) => route.toEntity()).toList());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }
}
