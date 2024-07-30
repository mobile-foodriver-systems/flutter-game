// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      walletAddress: json['walletAddress'] as String?,
      balance: json['balance'] as num? ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'userName': instance.userName,
      'email': instance.email,
      'walletAddress': instance.walletAddress,
      'balance': instance.balance,
    };
