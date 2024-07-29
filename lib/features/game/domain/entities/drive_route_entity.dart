import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/features/game/data/models/city.dart';
import 'package:food_driver/features/game/data/models/lat_lng.dart';

class DriveRouteEntity extends Equatable {
  const DriveRouteEntity({
    this.id,
    this.city,
    this.tapCount,
    this.seconds,
    this.reward,
    this.coordinatesList = const [],
  });

  final int? id;
  final City? city;
  final int? tapCount;
  final int? seconds;
  final num? reward;
  final List<LatLng?> coordinatesList;

  LatLng? get startPoint =>
      coordinatesList.firstWhereOrNull((coordinate) => coordinate != null);

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
