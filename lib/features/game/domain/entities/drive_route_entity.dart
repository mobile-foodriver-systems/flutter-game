import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/features/game/data/models/city.dart';
import 'package:food_driver/features/game/data/models/lat_lng.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;

class DriveRouteEntity extends Equatable {
  const DriveRouteEntity({
    required this.id,
    this.city,
    this.tapCount,
    this.seconds = 20,
    this.reward = 0.02,
    this.coordinatesList = const [],
  });

  final int id;
  final City? city;
  final int? tapCount;
  final int seconds;
  final num reward;
  final List<LatLng?> coordinatesList;

  LatLng? get startPoint =>
      coordinatesList.firstWhereOrNull((coordinate) => coordinate != null);

  List<gm.LatLng> get points => coordinatesList
      .whereType<LatLng>()
      .map((point) => gm.LatLng(point.latitude, point.longitude))
      .toList();

  gm.Marker? get marker => startPoint == null
      ? null
      : gm.Marker(
          markerId: gm.MarkerId(id.toString()),
          position: gm.LatLng(startPoint!.latitude, startPoint!.longitude),
        );

  @override
  List<Object?> get props => [
        id,
        city,
        tapCount,
        seconds,
        reward,
        coordinatesList,
      ];
}
