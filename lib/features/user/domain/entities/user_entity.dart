import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final int rating;
  final String? userName;
  final String? email;
  final String? walletAddress;
  final num balance;

  const UserEntity({
    required this.id,
    required this.rating,
    this.userName,
    this.email,
    this.walletAddress,
    required this.balance,
  });

  @override
  List<Object?> get props => [
        id,
        rating,
        userName,
        email,
        walletAddress,
        balance,
      ];
}
