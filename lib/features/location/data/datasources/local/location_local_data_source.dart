import 'package:food_driver/core/services/local_storage/local_storage_service.dart';
import 'package:injectable/injectable.dart';

part 'location_local_data_source_impl.dart';

abstract interface class LocationLocalDataSource {
  Future<int> getCityId();

  Future<void> saveCityId({
    required int cityId,
  });

  Future<void> deleteCityId();
}
