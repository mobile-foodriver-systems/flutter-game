import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:food_driver/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:food_driver/features/auth/data/models/auth_model.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:injectable/injectable.dart';

part 'auth_repository_impl.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> logIn({
    required String email,
    required String code,
  });

  void logOut();
}
