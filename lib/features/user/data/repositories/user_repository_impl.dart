part of 'package:food_driver/features/user/domain/repositories/user_repository.dart';

@LazySingleton(
  as: UserRepository,
  env: [Environment.prod, Environment.dev],
)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  const UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity?>> getUser() async {
    try {
      final response = await _remoteDataSource.profile();
      return Right(response?.toEntity());
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
