part of 'package:food_driver/features/location/domain/repositories/location_repository.dart';

@LazySingleton(
  as: LocationRepository,
  env: [Environment.prod, Environment.dev],
)
class LocationRepositoryImpl extends LocationRepository {
  LocationRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  final LocationRemoteDataSource _remoteDataSource;
  final LocationLocalDataSource _localDataSource;

  @override
  Future<void> deleteCityId() async {
    return await _localDataSource.deleteCityId();
  }

  @override
  Future<int> getCityId() async {
    return await _localDataSource.getCityId();
  }

  @override
  Future<void> saveCityId({
    required int cityId,
  }) async {
    return await _localDataSource.saveCityId(cityId: cityId);
  }

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
  Future<Either<Failure, CityListEntity>> getCityList({
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
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<Failure, CountryListEntity>> getCountryList({
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
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }
}
