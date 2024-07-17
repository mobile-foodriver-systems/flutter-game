import 'package:food_driver/features/auth/models/auth_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthModel?> getTokenModel({
    required String email,
    required String code,
  });

  Future<bool> getConfirmationCode({
    required String email,
  });
}
