import 'package:food_driver/features/user/data/models/user.dart';

abstract class UserRemoteDataSource {
  Future<User> profile();

  Future<num?> balance();

  Future<bool> logout();

  Future<bool> deleteAccount();
}
