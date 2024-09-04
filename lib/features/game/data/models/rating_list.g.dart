// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingList _$RatingListFromJson(Map<String, dynamic> json) => RatingList(
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => UserRating.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    )..offset = (json['offset'] as num?)?.toInt();

Map<String, dynamic> _$RatingListToJson(RatingList instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'list': instance.list,
    };
