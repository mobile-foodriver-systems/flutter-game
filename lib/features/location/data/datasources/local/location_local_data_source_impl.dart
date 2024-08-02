part of "location_local_data_source.dart";

@LazySingleton(
  as: LocationLocalDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final LocalStorageService _localStorageService;

  const LocationLocalDataSourceImpl(this._localStorageService);

  static const String cityIdKey = "cityId";

  @override
  Future<void> deleteCityId() async {
    await _localStorageService.removeValue(key: cityIdKey);
  }

  @override
  Future<int> getCityId() async {
    return await _localStorageService.getValue(key: cityIdKey);
  }

  @override
  Future<void> saveCityId({required int cityId}) async {
    await _localStorageService.setValue(
      key: cityIdKey,
      value: cityId,
    );
  }
}
