import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/features/auth/data/models/auth_model.dart';
import 'package:food_driver/features/auth/data/models/identity.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:injectable/injectable.dart';

part 'auth_remote_data_source_impl.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthModel> getAuthModel({
    required String email,
    required String code,
  });

  Future<Response<dynamic>> getAuthModelByPassword({
    required String login,
    required String password,
  });

  Future<bool> getConfirmationCode({
    required String email,
  });

  Future<AuthModel> initAuth();

  Future logout({required AuthEntity auth});

  Future<AuthModel> updateAuthModel({required String refreshToken});

  Future<Response<dynamic>> registration({
    required String login,
    required String password,
  });
}
