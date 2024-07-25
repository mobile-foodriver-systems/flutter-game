import 'package:food_driver/features/game/data/models/lat_lng.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drive_route.g.dart';

@JsonSerializable()
class DriveRoute {
  final int? tapCount;
  final int? seconds;
  final num? reward;
  final List<LatLng?> points;

  DriveRoute({
    this.tapCount,
    this.seconds,
    this.reward,
    this.points = const [],
  });

  Duration? get time => seconds == null ? null : Duration(seconds: seconds!);

  factory DriveRoute.fromJson(Map<String, dynamic> json) =>
      _$DriveRouteFromJson(json);
  Map<String, dynamic> toJson() => _$DriveRouteToJson(this);
}

extension DriveRouteX on DriveRoute {
  DriveRouteEntity toEntity() {
    return DriveRouteEntity(
      tapCount: tapCount,
      seconds: seconds,
      reward: reward,
      points: points,
    );
  }
}
