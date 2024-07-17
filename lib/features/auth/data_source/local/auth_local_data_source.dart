import 'package:food_driver/features/auth/models/auth_model.dart';

abstract interface class AuthLocalDataSource {
  Future<AuthModel?> getTokenModel();

  Future<void> saveTokenModel({
    required AuthModel authModel,
  });

  Future<void> deleteTokenModel();
}
