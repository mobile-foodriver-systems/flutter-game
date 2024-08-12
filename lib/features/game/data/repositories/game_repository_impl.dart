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

  @override
  Future<Either<ApiErrorStack, RaitingList>> loadRaitingList({
    int? radiusInKm,
    int limit = 20,
    int? offset,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.getUsersRatingList(
        radiusInKm: radiusInKm,
        limit: limit,
        offset: offset ?? 0,
      );
      if (response.statusCode == 200) {
        return Right(RaitingList.fromJson(response.data));
      }
      return Left((response.data?.isEmpty ?? true)
          ? ApiErrorStack.fromFailure(
              EmptyDataFailure(message: S.current.gamePageSomethingWrong))
          : ApiErrorStack.fromJson(response.data));
    } catch (e, s) {
      try {
        if (response?.data != null) {
          return Left(ApiErrorStack.fromJson(response!.data));
        }
        return Left(ApiErrorStack.fromFailure(
            ExceptionToFailureConverter.convert(e, s)));
      } catch (e) {
        return Left(ApiErrorStack.fromFailure(
            ExceptionToFailureConverter.convert(e, s)));
      }
    }
  }

  @override
  void moveOnRoute({required List<int> clickTimeList}) {
    _remoteDataSource.moveOnRoute(clickTimeList: clickTimeList);
  }

  @override
  void startGame({required int cityId}) {
    _remoteDataSource.startGame(cityId: cityId);
  }

  @override
  void stopGame() {
    _remoteDataSource.stopGame();
  }

  @override
  void takeRoute({required int routeId}) {
    _remoteDataSource.takeRoute(routeId: routeId);
  }
}
