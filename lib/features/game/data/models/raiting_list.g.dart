// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raiting_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaitingList _$RaitingListFromJson(Map<String, dynamic> json) => RaitingList(
      count: (json['count'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => UserRating.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RaitingListToJson(RaitingList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'limit': instance.limit,
      'offset': instance.offset,
      'list': instance.list,
    };
