part of 'package:food_driver/features/location/domain/repositories/location_repository.dart';

@LazySingleton(
  as: LocationRepository,
  env: [Environment.prod, Environment.dev],
)
class LocationRepositoryImpl extends LocationRepository {
  LocationRepositoryImpl(
    this._remoteDataSource,
  );

  final LocationRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, UserLocationEntity>> getCityByLatLng({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _remoteDataSource.getCityByLatLng(
        latitude: latitude,
        longitude: longitude,
      );
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<Failure, CityList>> getCityList({
    required int countryId,
    String? searchText,
    int limit = 20,
    int? offset,
  }) async {
    try {
      final response = await _remoteDataSource.getCityList(
        countryId: countryId,
        searchText: searchText,
        limit: limit,
        offset: offset,
      );
      return Right(response);
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<Failure, CountryList>> getCountryList({
    String? searchText,
    int limit = 20,
    int? offset,
  }) async {
    try {
      final response = await _remoteDataSource.getCountryList(
        searchText: searchText,
        limit: limit,
        offset: offset,
      );
      return Right(response);
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }
}
