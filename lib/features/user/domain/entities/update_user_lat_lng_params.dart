import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UpdateUserLatLngParams extends Equatable {
  const UpdateUserLatLngParams({
    required this.id,
    required this.latLng,
  });

  final int id;
  final LatLng latLng;

  @override
  List<Object?> get props => [
        id,
        latLng,
      ];
}
