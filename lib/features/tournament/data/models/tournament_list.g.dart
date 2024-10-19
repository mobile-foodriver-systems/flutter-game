// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentList _$TournamentListFromJson(Map<String, dynamic> json) =>
    TournamentList(
      count: (json['count'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => Tournament.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TournamentListToJson(TournamentList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'limit': instance.limit,
      'offset': instance.offset,
      'list': instance.list,
    };
