import 'package:food_driver/features/auth/models/auth_model.dart';

abstract interface class AuthLocalDataSource {
  Future<AuthModel?> getAuthModel();

  Future<void> saveAuthModel({
    required AuthModel authModel,
  });

  Future<void> deleteAuthModel();
}
