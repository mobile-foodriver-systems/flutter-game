import 'package:equatable/equatable.dart';
import 'package:food_driver/features/game/data/models/lat_lng.dart';

class DriveRouteEntity extends Equatable {
  const DriveRouteEntity({
    this.tapCount,
    this.seconds,
    this.reward,
    this.points = const [],
  });

  final int? tapCount;
  final int? seconds;
  final num? reward;
  final List<LatLng?> points;

  @override
  List<Object?> get props => [
        tapCount,
        seconds,
        reward,
        points,
      ];
}
