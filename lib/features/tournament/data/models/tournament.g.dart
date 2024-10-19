// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      isParticipant: json['isParticipant'] as bool,
      topUserCount: (json['topUserCount'] as num).toInt(),
      endDate: DateTime.parse(json['endDate'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
    );

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isParticipant': instance.isParticipant,
      'topUserCount': instance.topUserCount,
      'endDate': instance.endDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
    };
