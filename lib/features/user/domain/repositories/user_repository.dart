import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:food_driver/features/user/data/models/models/user.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/user/data/repositories/user_repository_impl.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity?>> getUser();
}
