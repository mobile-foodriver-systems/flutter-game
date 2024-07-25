import 'package:food_driver/features/auth/data/models/auth_model.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthModel> getAuthModel({
    required String email,
    required String code,
  });

  Future<AuthModel> getAuthModelByPassword({
    required String login,
    required String password,
  });

  Future<bool> getConfirmationCode({
    required String email,
  });

  Future logout({required AuthEntity auth});
}
