import 'package:food_driver/core/services/geolocation/geolocation_service.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/domain/entities/user_location_entity.dart';
import 'package:food_driver/features/location/domain/repositories/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: GeolocationService)
class GeolocationServiceImpl implements GeolocationService {
  final LocationRepository _locationRepository;

  const GeolocationServiceImpl(
    this._locationRepository,
  );

  @override
  Future<Position?> determineLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return null;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<City?> getCity({required LatLng latLng}) async {
    final response = await _locationRepository.getCityByLatLng(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
    );
    UserLocationEntity? userLocation;
    response.fold(
      (error) {},
      (result) {
        userLocation = result;
      },
    );
    return userLocation?.city;
  }
}
