// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameRoute _$GameRouteFromJson(Map<String, dynamic> json) => GameRoute(
      tapCount: (json['tapCount'] as num?)?.toInt(),
      seconds: (json['seconds'] as num?)?.toInt(),
      reward: json['reward'] as num?,
      points: (json['points'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : LatLng.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GameRouteToJson(GameRoute instance) => <String, dynamic>{
      'tapCount': instance.tapCount,
      'seconds': instance.seconds,
      'reward': instance.reward,
      'points': instance.points,
    };
