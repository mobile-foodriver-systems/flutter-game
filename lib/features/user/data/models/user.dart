import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String? userName;
  final String? email;
  final String? walletAddress;
  final num balanceInFDT;
  final City? city;

  const User({
    required this.id,
    this.userName,
    this.email,
    this.walletAddress,
    this.balanceInFDT = 0,
    this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension UserX on User {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      userName: userName,
      email: email,
      walletAddress: walletAddress,
      balance: balanceInFDT,
      city: city,
    );
  }
}
