// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteList _$RouteListFromJson(Map<String, dynamic> json) => RouteList(
      routeList: (json['routeList'] as List<dynamic>?)
              ?.map((e) => DriveRoute.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RouteListToJson(RouteList instance) => <String, dynamic>{
      'routeList': instance.routeList,
    };
