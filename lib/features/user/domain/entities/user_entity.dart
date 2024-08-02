import 'package:equatable/equatable.dart';
import 'package:food_driver/features/location/data/models/city.dart';

class UserEntity extends Equatable {
  final int id;
  final String? userName;
  final String? email;
  final String? walletAddress;
  final num balance;
  final City? city;

  const UserEntity({
    required this.id,
    this.userName,
    this.email,
    this.walletAddress,
    required this.balance,
    this.city,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        email,
        walletAddress,
        balance,
        city,
      ];
}
