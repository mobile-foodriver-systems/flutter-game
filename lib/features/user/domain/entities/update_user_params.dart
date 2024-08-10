import 'package:equatable/equatable.dart';

class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    this.cityId,
    this.email,
    this.walletAddress,
  });

  final int? cityId;
  final String? email;
  final String? walletAddress;

  @override
  List<Object?> get props => [
        cityId,
        email,
        walletAddress,
      ];
}
