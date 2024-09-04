import 'package:equatable/equatable.dart';

class ConfirmRecoveryParams extends Equatable {
  const ConfirmRecoveryParams({
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  List<Object?> get props => [
        email,
        code,
      ];
}
