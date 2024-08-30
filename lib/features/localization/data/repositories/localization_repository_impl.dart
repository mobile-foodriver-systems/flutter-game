part of 'package:food_driver/features/localization/domain/repositories/localization_repository.dart';

@LazySingleton(
  as: LocalizationRepository,
  env: [Environment.prod, Environment.dev],
)
class LocalizationRepositoryImpl extends LocalizationRepository {
  LocalizationRepositoryImpl(
    this._remoteDataSource,
  );

  final LocalizationRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, SupportedLocales>> getSupportedLocales() async {
    try {
      final response = await _remoteDataSource.getSupportedLocales();
      return Right(response);
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<Failure, PhrasesDictionary>> getSupportedLocale(
    String locale,
  ) async {
    try {
      final response = await _remoteDataSource.getSupportedLocales();
      return Right(response.toJson()[locale] ?? response.en);
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }
}
