import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:json_annotation/json_annotation.dart';

part 'lat_lng.g.dart';

@JsonSerializable()
class LatLng {
  final double latitude;
  final double longitude;

  LatLng(
    this.latitude,
    this.longitude,
  );

  gm.LatLng get gmLatLng => gm.LatLng(
        latitude,
        longitude,
      );

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);
}
