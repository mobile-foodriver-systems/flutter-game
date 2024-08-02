// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityList _$CityListFromJson(Map<String, dynamic> json) => CityList(
      count: (json['count'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => City.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CityListToJson(CityList instance) => <String, dynamic>{
      'count': instance.count,
      'limit': instance.limit,
      'offset': instance.offset,
      'list': instance.list,
    };
