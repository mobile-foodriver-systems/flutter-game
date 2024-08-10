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
    int? cityId,
    String? email,
    String? walletAddress,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.update(
        cityId: cityId,
        email: email,
        walletAddress: walletAddress,
      );
      if (response.statusCode == 200) {
        return Right(NoParams());
      }
      return Left((response.data?.isEmpty ?? true)
          ? ApiErrorStack.fromFailure(
              EmptyDataFailure(message: S.current.gamePageSomethingWrong))
          : ApiErrorStack.fromJson(response.data));
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
    required double latitude,
    required double longitude,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.updateLatLng(
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
}
