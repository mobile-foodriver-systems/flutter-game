import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:food_driver/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:food_driver/features/auth/data/models/auth_error.dart';
import 'package:food_driver/features/auth/data/models/auth_model.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:food_driver/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/auth/data/repositories/auth_repository_impl.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String code,
  });

  Future<Either<AuthError, AuthEntity>> loginByPassword({
    required String login,
    required String password,
  });

  Future<void> logout();

  Future<void> delete();

  Future<AuthEntity?> getAuthEntity();

  Future<Either<Failure, AuthEntity>> initAuthEntity();

  Future<Either<Failure, AuthEntity>> refreshAuthModel({
    required String refreshToken,
  });

  Future<Either<ApiErrorStack, NoParams>> registration({
    required String login,
    required String password,
  });

  Future<void> breakAccessToken();
}
