part of 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(
  as: AuthRepository,
  env: [Environment.prod, Environment.dev],
)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _remoteDataSource.getAuthModel(
        email: email,
        code: code,
      );
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<void> logout() async {
    AuthModel? auth;
    try {
      auth = await _localDataSource.getAuthModel();
      await _localDataSource.deleteAuthModel();
    } catch (e) {
      if (auth == null) return;
      _remoteDataSource.logout(auth: auth.toEntity());
    }
  }

  @override
  Future<Either<AuthError, AuthEntity>> loginByPassword({
    required String login,
    required String password,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.getAuthModelByPassword(
        login: login,
        password: password,
      );
      if (response.statusCode == 200) {
        final authModel = AuthModel.fromJson(response.data);
        await _localDataSource.saveAuthModel(authModel: authModel);
        return Right(authModel.toEntity());
      }
      return Left(AuthError.fromJson(response.data));
    } catch (e, s) {
      try {
        if (response?.data != null) {
          return Left(AuthError.fromJson(response?.data));
        }
        return Left(
            AuthError.fromFailure(ExceptionToFailureConverter.convert(e, s)));
      } catch (e) {
        return Left(
            AuthError.fromFailure(ExceptionToFailureConverter.convert(e, s)));
      }
    }
  }

  @override
  Future<AuthEntity?> getAuthEntity() async {
    try {
      final auth = (await _localDataSource.getAuthModel());
      return auth.toEntity();
    } catch (e, _) {
      return null;
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> initAuthEntity() async {
    print("AAA AuthRepository initAuthEntity");
    try {
      final response = await _remoteDataSource.initAuth();
      await _localDataSource.saveAuthModel(authModel: response);
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> refreshAuthModel(
      {required String refreshToken}) async {
    try {
      final response =
          (await _remoteDataSource.updateAuthModel(refreshToken: refreshToken));
      await _localDataSource.saveAuthModel(authModel: response);
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  Future<Either<RegistrationError, NoParams>> registration({
    required String login,
    required String password,
  }) async {
    Response<dynamic>? response;
    try {
      response = await _remoteDataSource.registration(
        login: login,
        password: password,
      );
      if (response.statusCode == 200) {
        return Right(NoParams());
      }
      return Left(RegistrationError.fromJson(response.data));
    } catch (e, s) {
      try {
        if (response?.data != null) {
          return Left(RegistrationError.fromJson(response?.data));
        }
        return Left(RegistrationError.fromFailure(
            ExceptionToFailureConverter.convert(e, s)));
      } catch (e) {
        return Left(RegistrationError.fromFailure(
            ExceptionToFailureConverter.convert(e, s)));
      }
    }
  }

  @override
  Future<void> breakAccessToken() async {
    final auth = await _localDataSource.getAuthModel();
    await _localDataSource.saveAuthModel(
        authModel: AuthModel(
      accessToken: "break",
      refreshToken: auth.refreshToken,
      expiresIn: auth.expiresIn,
      tokenType: auth.tokenType,
      scope: auth.scope,
    ));
  }
}
