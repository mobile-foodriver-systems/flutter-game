import 'package:equatable/equatable.dart';

class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    required this.id,
    this.cityId,
    this.email,
    this.walletAddress,
  });

  final int id;
  final int? cityId;
  final String? email;
  final String? walletAddress;

  @override
  List<Object?> get props => [
        id,
        cityId,
        email,
        walletAddress,
      ];
}
