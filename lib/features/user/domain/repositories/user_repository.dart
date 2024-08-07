import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:food_driver/features/user/data/models/user.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/user/data/repositories/user_repository_impl.dart';

abstract class UserRepository {
  final _controller = StreamController<UserEntity?>();

  Future<Either<Failure, UserEntity>> getUser();

  Future<Either<ApiErrorStack, NoParams>> updateUser({
    required int id,
    int? cityId,
    String? email,
    String? walletAddress,
  });

  Future<Either<ApiErrorStack, NoParams>> updateUserLatLng({
    required int id,
    required double latitude,
    required double longitude,
  });

  void setUser({
    required UserEntity user,
  });

  Stream<UserEntity?> userFromStream();
}
