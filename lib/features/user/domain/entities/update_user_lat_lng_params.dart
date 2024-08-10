import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UpdateUserLatLngParams extends Equatable {
  const UpdateUserLatLngParams({
    required this.latLng,
  });

  final LatLng latLng;

  @override
  List<Object?> get props => [
        latLng,
      ];
}
