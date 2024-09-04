import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:food_driver/features/user/data/models/user.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/user/data/repositories/user_repository_impl.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();

  Future<Either<ApiErrorStack, NoParams>> updateUser({
    int? cityId,
    String? email,
    String? walletAddress,
  });

  Future<Either<ApiErrorStack, NoParams>> updateUserLatLng({
    required double latitude,
    required double longitude,
  });

  Future<Either<ApiErrorStack, bool>> getConfirmationCode({
    required String email,
  });

  Future<Either<ApiErrorStack, bool>> sendConfirmationCode({
    required String code,
  });

  Future<Either<ApiErrorStack, bool>> recoveryPassword({
    required String email,
    required String password,
  });

  Future<Either<ApiErrorStack, bool>> confirmPasswordRecovery({
    required String email,
    required String code,
  });
}
