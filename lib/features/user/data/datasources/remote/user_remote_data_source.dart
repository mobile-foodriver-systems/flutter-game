import 'package:dio/dio.dart';
import 'package:food_driver/features/user/data/models/user.dart';

abstract class UserRemoteDataSource {
  Future<User> profile();

  Future<bool> logout();

  Future<bool> deleteAccount();

  Future<Response<dynamic>> update({
    int? cityId,
    String? email,
    String? walletAddress,
  });

  Future<Response<dynamic>> updateLatLng({
    required double latitude,
    required double longitude,
  });

  Future<Response<dynamic>> recoveryPassword({
    required String email,
    required String password,
  });

  Future<Response<dynamic>> confirmPasswordRecovery({
    required String email,
    required String code,
  });

  Future<Response<dynamic>> getConfirmationCode({required String email});

  Future<Response<dynamic>> sendConfirmationCode({required String code});
}
