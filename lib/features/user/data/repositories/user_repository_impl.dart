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
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final response = await _remoteDataSource.profile();
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<Either<ApiErrorStack, NoParams>> updateUser({
    required int id,
    int? cityId,
    String? email,
    String? walletAddress,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.update(
        id: id,
        cityId: cityId,
        email: email,
        walletAddress: walletAddress,
      );
      if (response.statusCode == 200) {
        return Right(NoParams());
      }
      return Left(ApiErrorStack.fromJson(response.data));
    } catch (e, s) {
      try {
        if (response?.data != null) {
          return Left(ApiErrorStack.fromJson(response!.data));
        }
        return Left(ApiErrorStack.fromFailure(
            ExceptionToFailureConverter.convert(e, s)));
      } catch (e) {
        return Left(ApiErrorStack.fromFailure(
            ExceptionToFailureConverter.convert(e, s)));
      }
    }
  }

  @override
  Future<Either<ApiErrorStack, NoParams>> updateUserLatLng({
    required int id,
    required double latitude,
    required double longitude,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.updateLatLng(
        id: id,
        latitude: latitude,
        longitude: longitude,
      );
      if (response.statusCode == 200) {
        return Right(NoParams());
      }
      return Left(ApiErrorStack.fromJson(response.data));
    } catch (e, s) {
      try {
        if (response?.data != null) {
          return Left(ApiErrorStack.fromJson(response!.data));
        }
        return Left(ApiErrorStack.fromFailure(
            ExceptionToFailureConverter.convert(e, s)));
      } catch (e) {
        return Left(ApiErrorStack.fromFailure(
            ExceptionToFailureConverter.convert(e, s)));
      }
    }
  }

  @override
  void addUserToStream({required UserEntity user}) {
    _controller.sink.add(user);
  }

  @override
  Future<UserEntity?> userFromStream() {
    // TODO: implement userFromStream
    throw UnimplementedError();
  }
}
