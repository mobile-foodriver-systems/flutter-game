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
    String? userName,
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
              EmptyDataFailure(message: LocaleKeys.gamePageSomethingWrong.tr()),
            )
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

  @override
  Future<Either<ApiErrorStack, bool>> confirmPasswordRecovery({
    required String email,
    required String code,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.confirmPasswordRecovery(
        email: email,
        code: code,
      );
      if (response.statusCode == 200) {
        return const Right(true);
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
  Future<Either<ApiErrorStack, bool>> getConfirmationCode({
    required String email,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.getConfirmationCode(
        email: email,
      );
      if (response.statusCode == 200) {
        return const Right(true);
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
  Future<Either<ApiErrorStack, bool>> recoveryPassword({
    required String email,
    required String password,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.recoveryPassword(
        email: email,
        password: password,
      );
      if (response.statusCode == 200) {
        return const Right(true);
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
  Future<Either<ApiErrorStack, bool>> sendConfirmationCode({
    required String code,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.sendConfirmationCode(
        code: code,
      );
      if (response.statusCode == 200) {
        return const Right(true);
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
