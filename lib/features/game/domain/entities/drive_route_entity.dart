import 'package:equatable/equatable.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/game/data/models/lat_lng.dart';
import 'package:food_driver/features/game/domain/entities/marker_entity.dart';
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

  List<LatLng> get coordinatesListSafe =>
      coordinatesList.whereType<LatLng>().toList();

  LatLng? get startPoint =>
      coordinatesListSafe.isEmpty ? null : coordinatesListSafe.first;

  LatLng? get finishPoint =>
      coordinatesListSafe.length > 1 ? coordinatesListSafe.last : null;

  gm.LatLng? get startCoordinate => startPoint == null
      ? null
      : gm.LatLng(startPoint!.latitude, startPoint!.longitude);

  gm.LatLng? get finishCoordinate => finishPoint == null
      ? null
      : gm.LatLng(finishPoint!.latitude, finishPoint!.longitude);

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

  MarkerEntity? get markerEntity => startCoordinate == null
      ? null
      : MarkerEntity(
          markerId: id,
          coordinate: startCoordinate!,
          markerType: MarkerType.route,
          reward: reward,
          seconds: seconds,
        );

  Set<MarkerEntity> get startFinishEntities =>
      startCoordinate == null && finishCoordinate == null
          ? {}
          : {
              if (startCoordinate != null)
                MarkerEntity(
                  markerId: -1,
                  coordinate: startCoordinate!,
                  markerType: MarkerType.driver,
                ),
              if (finishCoordinate != null)
                MarkerEntity(
                  markerId: -2,
                  coordinate: finishCoordinate!,
                  markerType: MarkerType.finish,
                ),
            };

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
