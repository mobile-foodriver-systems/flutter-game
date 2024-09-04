import 'package:equatable/equatable.dart';
import 'package:food_driver/features/game/data/models/lat_lng.dart';
import 'package:food_driver/features/location/data/models/city.dart';

class UserEntity extends Equatable {
  final int id;
  final String? userName;
  final String? email;
  final String? walletAddress;
  final num balance;
  final City? city;
  final LatLng? location;

  const UserEntity({
    required this.id,
    this.userName,
    this.email,
    this.walletAddress,
    required this.balance,
    this.city,
    this.location,
  });

  factory UserEntity.update({
    UserEntity? user,
    City? city,
    String? walletAddress,
    String? email,
    LatLng? location,
  }) {
    return UserEntity(
      id: user?.id ?? -1,
      userName: user?.userName,
      email: email ?? user?.email,
      walletAddress: walletAddress ?? user?.walletAddress,
      balance: user?.balance ?? 0,
      city: city ?? user?.city,
      location: location ?? user?.location,
    );
  }

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
