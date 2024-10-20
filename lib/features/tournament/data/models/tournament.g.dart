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
      endDate: const DateTimeJsonConverter()
          .fromJson((json['endDate'] as num).toInt()),
      startDate: const DateTimeJsonConverter()
          .fromJson((json['startDate'] as num).toInt()),
    );

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isParticipant': instance.isParticipant,
      'topUserCount': instance.topUserCount,
      'endDate': const DateTimeJsonConverter().toJson(instance.endDate),
      'startDate': const DateTimeJsonConverter().toJson(instance.startDate),
    };
