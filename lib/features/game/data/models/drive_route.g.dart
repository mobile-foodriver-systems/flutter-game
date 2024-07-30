// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriveRoute _$DriveRouteFromJson(Map<String, dynamic> json) => DriveRoute(
      id: (json['id'] as num).toInt(),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      tapCount: (json['tapCount'] as num?)?.toInt(),
      seconds: (json['seconds'] as num?)?.toInt() ?? 20,
      reward: json['reward'] as num? ?? 0.02,
      coordinateList: (json['coordinateList'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : LatLng.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DriveRouteToJson(DriveRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'tapCount': instance.tapCount,
      'seconds': instance.seconds,
      'reward': instance.reward,
      'coordinateList': instance.coordinateList,
    };
