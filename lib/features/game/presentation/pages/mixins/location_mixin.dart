import 'package:flutter/material.dart';
import 'package:food_driver/core/services/geolocation/geolocation_service.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/data/models/country.dart';
import 'package:food_driver/features/location/presentation/pages/city_list_page.dart';
import 'package:food_driver/features/location/presentation/pages/country_list_page.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin LocationMixin<T extends StatefulWidget> on State<T> {
  final UserRepository userRepository = getIt<UserRepository>();
  final GeolocationService _geolocationService = getIt<GeolocationService>();

  Future<City?> tryGetCity() async {
    final Position? position = await _geolocationService.determineLocation();

    if (position != null) {
      final latLng = LatLng(position.latitude, position.longitude);
      await userRepository.updateUserLatLng(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );
      final city = await _geolocationService.getCity(latLng: latLng);
      if (city?.id != null) {
        userRepository.updateUser(cityId: city?.id);
        return city;
      }
    }
    if (!mounted) return null;

    City? city;
    final country = await showSelectDialog<Country>(
      context,
      child: const CountryListPage(),
    );
    if (country != null && mounted) {
      city = await showSelectDialog<City>(
        context,
        child: CityListPage(countryId: country.id),
      );
    }
    if (city != null) {
      userRepository.updateUser(cityId: city.id);
      return city;
    }
    return null;
  }

  Future<TD?> showSelectDialog<TD>(
    BuildContext context, {
    required Widget child,
  }) async {
    return await showDialog<TD>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.62,
            width: MediaQuery.sizeOf(context).width,
            child: child,
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
        );
      },
    );
  }
}
