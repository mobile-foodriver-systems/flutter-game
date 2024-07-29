import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final int rating;
  final String? userName;
  final String? email;
  final String? wallet;

  const User({
    required this.id,
    required this.rating,
    this.userName,
    this.email,
    this.wallet,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension UserX on User {
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      wallet: wallet,
    );
  }
}
