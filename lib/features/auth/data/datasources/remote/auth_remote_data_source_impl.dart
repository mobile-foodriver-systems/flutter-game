import 'dart:convert';

import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:food_driver/features/auth/data/models/auth_model.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(
  as: AuthRemoteDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AppHttpService _appHttpService;

  AuthRemoteDataSourceImpl(
    this._appHttpService,
  );

  @override
  Future<bool> getConfirmationCode({
    required String email,
  }) async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.post,
      queryParameters: {"email": email},
    );
    return response.statusCode == 200;
  }

  @override
  Future<AuthModel> getAuthModel({
    required String email,
    required String code,
  }) async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.post,
      queryParameters: {
        "email": email,
        "code": code,
      },
    );
    return AuthModel.fromJson(jsonDecode(response.data));
  }

  @override
  Future<AuthModel> getAuthModelByPassword({
    required String login,
    required String password,
  }) async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.post,
      queryParameters: {
        "login": login,
        "password": password,
      },
    );
    return AuthModel.fromJson(jsonDecode(response.data));
  }

  @override
  Future<void> logout({required AuthEntity auth}) async {
    await _appHttpService.request(
      path: '',
      type: RequestType.post,
    );
  }
}
