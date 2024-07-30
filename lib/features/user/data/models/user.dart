import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final int rating;
  final String? userName;
  final String? email;
  final String? walletAddress;
  final num balance;

  const User({
    required this.id,
    required this.rating,
    this.userName,
    this.email,
    this.walletAddress,
    this.balance = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension UserX on User {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      rating: rating,
      userName: userName,
      email: email,
      walletAddress: walletAddress,
      balance: balance,
    );
  }
}
