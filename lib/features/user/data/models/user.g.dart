// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      walletAddress: json['walletAddress'] as String?,
      balanceInFDT: json['balanceInFDT'] as num? ?? 0,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'walletAddress': instance.walletAddress,
      'balanceInFDT': instance.balanceInFDT,
      'city': instance.city,
    };
