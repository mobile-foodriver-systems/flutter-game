part of "location_remote_data_source.dart";

@LazySingleton(
  as: LocationRemoteDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final AppHttpService _appHttpService;

  LocationRemoteDataSourceImpl(
    this._appHttpService,
  );

  @override
  Future<UserLocation> getCityByLatLng({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _appHttpService.request(
      path: ApiRoutes.cityByLatLng,
      type: RequestType.get,
      queryParameters: {
        "latitude": latitude,
        "longitude": longitude,
      },
    );
    return UserLocation.fromJson(response.data);
  }

  @override
  Future<CityList> getCityList({
    required int countryId,
    String? searchText,
    int limit = 20,
    int? offset,
  }) async {
    final response = await _appHttpService.request(
      path: ApiRoutes.cities,
      type: RequestType.get,
      queryParameters: {
        "countryId": countryId,
        if (searchText?.isNotEmpty ?? false) "searchText": searchText,
        "limit": limit,
        if (offset != null) "offset": offset,
      },
    );
    return CityList.fromJson(response.data);
  }

  @override
  Future<CountryList> getCountryList({
    String? searchText,
    int limit = 20,
    int? offset,
  }) async {
    final response = await _appHttpService.request(
      path: ApiRoutes.countries,
      type: RequestType.get,
      queryParameters: {
        if (searchText?.isNotEmpty ?? false) "searchText": searchText,
        "limit": limit,
        if (offset != null) "offset": offset,
      },
    );
    return CountryList.fromJson(response.data);
  }
}
