// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRating _$UserRatingFromJson(Map<String, dynamic> json) => UserRating(
      id: (json['id'] as num).toInt(),
      balanceInFDT: json['balanceInFDT'] as num? ?? 0,
      number: json['number'] as num? ?? 0,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$UserRatingToJson(UserRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balanceInFDT': instance.balanceInFDT,
      'number': instance.number,
      'userName': instance.userName,
    };
