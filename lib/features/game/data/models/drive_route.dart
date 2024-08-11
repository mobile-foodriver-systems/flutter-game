import 'package:food_driver/features/game/data/models/lat_lng.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drive_route.g.dart';

@JsonSerializable()
class DriveRoute {
  final int id;
  final City city;
  final num? fdtForDistance;
  final List<LatLng?> coordinateList;
  final int? timeForDistance;
  final num? metersPerClick;
  final num? distanceInMeters;
  final int? clickCountForDistance;

  DriveRoute({
    required this.id,
    required this.city,
    this.fdtForDistance = 0,
    this.coordinateList = const [],
    this.timeForDistance = 0,
    this.metersPerClick = 0,
    this.distanceInMeters = 0,
    this.clickCountForDistance = 0,
  });

  factory DriveRoute.fromJson(Map<String, dynamic> json) =>
      _$DriveRouteFromJson(json);
  Map<String, dynamic> toJson() => _$DriveRouteToJson(this);
}

extension DriveRouteX on DriveRoute {
  DriveRouteEntity toEntity() {
    return DriveRouteEntity(
      id: id,
      city: city,
      tapCount: clickCountForDistance ?? 0,
      seconds: timeForDistance ?? 0,
      reward: fdtForDistance ?? 0,
      coordinatesList: coordinateList,
      metersPerClick: metersPerClick ?? 0,
      distanceInMeters: distanceInMeters ?? 0,
    );
  }
}
