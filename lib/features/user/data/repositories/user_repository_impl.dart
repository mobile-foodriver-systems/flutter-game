// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:food_driver/features/user/domain/repositories/user_repository.dart';

@LazySingleton(
  as: UserRepository,
  env: [Environment.prod, Environment.dev],
)
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  UserRepositoryImpl(
    this._remoteDataSource,
  );

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
