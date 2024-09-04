import 'package:equatable/equatable.dart';

class RecoveryParams extends Equatable {
  const RecoveryParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
