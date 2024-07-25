import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? email;
  final String? wallet;

  const UserEntity({
    this.email,
    this.wallet,
  });

  bool get isEmpty => (email?.isEmpty ?? true) && (wallet?.isEmpty ?? true);

  bool get isNotEmpty => !isEmpty;

  static const empty = UserEntity();

  @override
  List<Object?> get props => [
        email,
        wallet,
      ];
}
