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
  // @override
  // final StreamController<AuthStatus> controller =
  //     StreamController<AuthStatus>();

  // @override
  // Stream<AuthStatus> get status async* {
  //   await Future<void>.delayed(const Duration(seconds: 1));
  //   yield AuthStatus.unauthenticated;
  //   yield* controller.stream;
  // }

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
    final auth = await _localDataSource.getAuthModel();
    _localDataSource.deleteAuthModel();
    _remoteDataSource.logout(auth: auth.toEntity());
  }

  @override
  Future<Either<Failure, AuthEntity>> loginByPassword({
    required String login,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.getAuthModelByPassword(
        login: login,
        password: password,
      );
      await _localDataSource.saveAuthModel(authModel: response);
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
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
    try {
      final response = (await _remoteDataSource.initAuth());
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
  Future<bool> registration({
    required String login,
    required String password,
  }) async {
    try {
      return await _remoteDataSource.registration(
        login: login,
        password: password,
      );
    } catch (e) {
      return false;
    }
  }
}
