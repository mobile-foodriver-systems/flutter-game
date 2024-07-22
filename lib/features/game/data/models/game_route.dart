import 'package:food_driver/features/game/data/models/lat_lng.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_route.g.dart';

@JsonSerializable()
class GameRoute {
  final int? tapCount;
  final int? seconds;
  final num? reward;
  final List<LatLng?> points;

  GameRoute({
    this.tapCount,
    this.seconds,
    this.reward,
    this.points = const [],
  });

  Duration? get time => seconds == null ? null : Duration(seconds: seconds!);

  factory GameRoute.fromJson(Map<String, dynamic> json) =>
      _$GameRouteFromJson(json);
  Map<String, dynamic> toJson() => _$GameRouteToJson(this);
}
