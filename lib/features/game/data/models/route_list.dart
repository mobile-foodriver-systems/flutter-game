import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_list.g.dart';

@JsonSerializable()
class RouteList {
  final List<DriveRoute> routeList;

  RouteList({
    this.routeList = const [],
  });

  factory RouteList.fromJson(Map<String, dynamic> json) =>
      _$RouteListFromJson(json);
  Map<String, dynamic> toJson() => _$RouteListToJson(this);
}
