import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/location/data/datasources/remote/location_remote_data_source.dart';
import 'package:food_driver/features/location/data/models/city_list.dart';
import 'package:food_driver/features/location/data/models/country_list.dart';
import 'package:food_driver/features/location/data/models/user_location.dart';
import 'package:food_driver/features/location/domain/entities/user_location_entity.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/location/data/repositories/location_repository_impl.dart';

abstract class LocationRepository {
  Future<Either<Failure, UserLocationEntity>> getCityByLatLng({
    required double latitude,
    required double longitude,
  });

  Future<Either<Failure, CountryList>> getCountryList({
    String? searchText,
    int limit = 20,
    int? offset,
  });

  Future<Either<Failure, CityList>> getCityList({
    required int countryId,
    String? searchText,
    int limit = 20,
    int? offset,
  });
}
