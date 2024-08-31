part of 'package:food_driver/features/localization/domain/repositories/localization_cache_repository.dart';

@LazySingleton(
  as: LocalizationCacheRepository,
  env: [Environment.prod, Environment.dev],
)
class LocalizationRepositoryImpl extends LocalizationCacheRepository {
  LocalizationRepositoryImpl(
    this._localDataSource,
  );

  final LocalizationLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, SupportedLocales>> getSupportedLocales() async {
    try {
      final response = await _localDataSource.getSupportedLocales();
      if (response != null) {
        return Right(response);
      }
      return const Left(NotFoundFailure(message: 'Data not found'));
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<Failure, PhrasesDictionary>> getSupportedLocale(
    String locale,
  ) async {
    try {
      final response = await _localDataSource.getSupportedLocales();
      if (response != null) {
        return Right(response.toJson()[locale] ?? response.en);
      }
      return const Left(NotFoundFailure(message: 'Data not found'));
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }
}
