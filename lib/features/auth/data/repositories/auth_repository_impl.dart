part of 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(
  as: AuthRepository,
  env: [Environment.prod, Environment.dev],
)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  @override
  final StreamController<AuthStatus> controller =
      StreamController<AuthStatus>();

  @override
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* controller.stream;
  }

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
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<void> logout({required AuthEntity auth}) async {
    _localDataSource.deleteAuthModel();
    controller.add(AuthStatus.unauthenticated);
    await _remoteDataSource.logout(auth: auth);
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
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
