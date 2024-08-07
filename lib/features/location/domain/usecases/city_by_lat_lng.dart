import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/location/domain/entities/user_location_entity.dart';
import 'package:food_driver/features/location/domain/repositories/location_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class CityByLatLngUseCase implements UseCase<UserLocationEntity, LatLng> {
  final LocationRepository _locationRepository;
  CityByLatLngUseCase(this._locationRepository);

  @override
  Future<Either<Failure, UserLocationEntity>> call(LatLng latLng) async {
    return await _locationRepository.getCityByLatLng(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
    );
  }
}
