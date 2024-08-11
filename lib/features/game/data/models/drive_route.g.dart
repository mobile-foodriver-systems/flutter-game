// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriveRoute _$DriveRouteFromJson(Map<String, dynamic> json) => DriveRoute(
      id: (json['id'] as num).toInt(),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      fdtForDistance: json['fdtForDistance'] as num? ?? 0,
      coordinateList: (json['coordinateList'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : LatLng.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      timeForDistance: (json['timeForDistance'] as num?)?.toInt() ?? 0,
      metersPerClick: json['metersPerClick'] as num? ?? 0,
      distanceInMeters: json['distanceInMeters'] as num? ?? 0,
      clickCountForDistance:
          (json['clickCountForDistance'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DriveRouteToJson(DriveRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'fdtForDistance': instance.fdtForDistance,
      'coordinateList': instance.coordinateList,
      'timeForDistance': instance.timeForDistance,
      'metersPerClick': instance.metersPerClick,
      'distanceInMeters': instance.distanceInMeters,
      'clickCountForDistance': instance.clickCountForDistance,
    };
