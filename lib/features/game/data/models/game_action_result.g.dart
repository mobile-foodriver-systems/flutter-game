// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_action_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameActionResult _$GameActionResultFromJson(Map<String, dynamic> json) =>
    GameActionResult(
      isSuccess: json['isSuccess'] as bool? ?? false,
      error: json['error'] == null
          ? null
          : ApiError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameActionResultToJson(GameActionResult instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'error': instance.error,
    };
