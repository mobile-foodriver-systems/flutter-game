import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:food_driver/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:food_driver/features/auth/data/models/auth_model.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/auth/data/repositories/auth_repository_impl.dart';

abstract class AuthRepository {
  // StreamController<AuthStatus> get controller;

  // Stream<AuthStatus> get status;

  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String code,
  });

  Future<Either<Failure, AuthEntity>> loginByPassword({
    required String login,
    required String password,
  });

  Future<void> logout();

  Future<AuthEntity?> getAuthEntity();

  Future<Either<Failure, AuthEntity>> initAuthEntity();
}
