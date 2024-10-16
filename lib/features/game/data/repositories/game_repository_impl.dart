part of 'package:food_driver/features/game/domain/repositories/game_repository.dart';

@LazySingleton(
  as: GameRepository,
  env: [Environment.prod, Environment.dev],
)
class GameRepositoryImpl extends GameRepository {
  GameRepositoryImpl(this._remoteDataSource);

  final GameRemoteDataSource _remoteDataSource;

  @override
  Future<Either<ApiErrorStack, RatingList>> loadRatingList({
    int? radiusInKm,
    int? limit,
    int? offset,
    double? longitude,
    double? latitude,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.getUsersRatingList(
        radiusInKm: radiusInKm,
        limit: limit,
        offset: offset,
        latitude: latitude,
        longitude: longitude,
      );
      if (response.statusCode == 200) {
        return Right(RatingList.fromJson(response.data));
      }
      return Left((response.data?.isEmpty ?? true)
          ? ApiErrorStack.fromFailure(
              EmptyDataFailure(
                message: LocaleKeys.gamePageSomethingWrong.tr(),
              ),
            )
          : ApiErrorStack.fromJson(response.data));
    } catch (e, s) {
      try {
        if (response?.data != null) {
          return Left(ApiErrorStack.fromJson(response!.data));
        }
        return Left(
          ApiErrorStack.fromFailure(ExceptionToFailureConverter.convert(e, s)),
        );
      } catch (e) {
        return Left(
          ApiErrorStack.fromFailure(ExceptionToFailureConverter.convert(e, s)),
        );
      }
    }
  }

  @override
  void moveOnRoute({required List<int> clickTimeList}) {
    _remoteDataSource.moveOnRoute(clickTimeList: clickTimeList);
  }

  @override
  Future<Either<Failure, GameActionResult>> startGame({
    required int cityId,
  }) async {
    try {
      return Right(await _remoteDataSource.startGame(cityId: cityId));
    } catch (e, s) {
      return Left(
        ApiErrorStack.fromFailure(ExceptionToFailureConverter.convert(e, s)),
      );
    }
  }

  @override
  void stopGame() {
    _remoteDataSource.stopGame();
  }

  @override
  Future<Either<Failure, GameActionResult>> takeRoute({
    required int routeId,
  }) async {
    try {
      return Right(await _remoteDataSource.takeRoute(routeId: routeId));
    } catch (e, s) {
      return Left(
        ApiErrorStack.fromFailure(ExceptionToFailureConverter.convert(e, s)),
      );
    }
  }

  @override
  Future<Either<Failure, GameActionResult>> cancelRoute() async {
    try {
      return Right(await _remoteDataSource.cancelRoute());
    } catch (e, s) {
      return Left(
        ApiErrorStack.fromFailure(ExceptionToFailureConverter.convert(e, s)),
      );
    }
  }
}
