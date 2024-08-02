// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryList _$CountryListFromJson(Map<String, dynamic> json) => CountryList(
      count: (json['count'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CountryListToJson(CountryList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'limit': instance.limit,
      'offset': instance.offset,
      'list': instance.list,
    };
