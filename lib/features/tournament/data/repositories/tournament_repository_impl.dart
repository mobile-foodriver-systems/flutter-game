part of 'package:food_driver/features/tournament/domain/repositories/tournament_repository.dart';

@LazySingleton(
  as: TournamentRepository,
  env: [Environment.prod, Environment.dev],
)
class TournamentRepositoryImpl extends TournamentRepository {
  final TournamentRemoteDatasource _remoteDataSource;

  TournamentRepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, List<Tournament>>> activeTournament() async {
    try {
      return Right(await _remoteDataSource.activeTournament());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<Failure, List<Tournament>>> completedTournament() async {
    try {
      return Right(await _remoteDataSource.completedTournament());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<ParticipateError, bool>> participateInTournament({
    bool? appStoreIsSandbox,
    int? gameTournamentId,
    String? appStorePurchaseReceiptData,
    String? googlePlayMarketPurchaseToken,
    String? huaweiGalleryPurchaseToken,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.participateInTournament(
        appStoreIsSandbox: appStoreIsSandbox,
        gameTournamentId: gameTournamentId,
        appStorePurchaseReceiptData: appStorePurchaseReceiptData,
        googlePlayMarketPurchaseToken: googlePlayMarketPurchaseToken,
        huaweiGalleryPurchaseToken: huaweiGalleryPurchaseToken,
      );
      if (response.statusCode == 200) {
        return const Right(true);
      }
      return Left((response.data?.isEmpty ?? true)
          ? ParticipateError.fromFailure(
              EmptyDataFailure(
                message: LocaleKeys.gamePageSomethingWrong.tr(),
              ),
            )
          : ParticipateError.fromJson(response.data));
    } catch (e, s) {
      return Left(
        ParticipateError.fromFailure(ExceptionToFailureConverter.convert(e, s)),
      );
    }
  }

  @override
  Future<Either<ApiErrorStack, TournamentList>> tournamentList({
    int? limit,
    int? offset,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.tournamentList(
        limit: limit,
        offset: offset,
      );
      if (response.statusCode == 200) {
        return Right(TournamentList.fromJson(response.data));
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
  Future<Either<ApiErrorStack, RatingList>> tournamentRating({
    required int id,
    int? radiusInKm,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.tournamentRating(
        id: id,
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
}
