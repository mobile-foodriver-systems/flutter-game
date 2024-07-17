import 'package:food_driver/features/profile/models/user.dart';

abstract class ProfileRemoteDataSource {
  Future<User?> getProfile();

  Future<num?> getBalance();

  Future<bool> logout();

  Future<bool> deleteAccount();
}
