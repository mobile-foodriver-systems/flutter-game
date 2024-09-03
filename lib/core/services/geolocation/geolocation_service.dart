import 'package:food_driver/features/location/data/models/city.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract interface class GeolocationService {
  Future<City?> getCity({required LatLng latLng});
  Future<Position?> determineLocation();
}
