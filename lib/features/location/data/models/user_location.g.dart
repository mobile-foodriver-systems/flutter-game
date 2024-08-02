// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) => UserLocation(
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserLocationToJson(UserLocation instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
    };
