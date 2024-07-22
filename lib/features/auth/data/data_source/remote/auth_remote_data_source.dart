import 'package:food_driver/features/auth/data/models/auth_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthModel> getAuthModel({
    required String email,
    required String code,
  });

  Future<bool> getConfirmationCode({
    required String email,
  });
}
