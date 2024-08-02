import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/features/location/data/models/city_list.dart';
import 'package:food_driver/features/location/data/models/country_list.dart';
import 'package:food_driver/features/location/data/models/user_location.dart';
import 'package:injectable/injectable.dart';

part 'location_remote_data_source_impl.dart';

abstract interface class LocationRemoteDataSource {
  Future<UserLocation> getCityByLatLng({
    required double latitude,
    required double longitude,
  });

  Future<CountryList> getCountryList({
    String? searchText,
    int limit = 20,
    int? offset,
  });

  Future<CityList> getCityList({
    required int countryId,
    String? searchText,
    int limit = 20,
    int? offset,
  });
}
