part of 'package:food_driver/features/auth/data/repository/auth_repository.dart';

@LazySingleton(
  as: AuthRepository,
  env: [Environment.prod, Environment.dev],
)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  AuthRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  final _controller = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<Either<Failure, AuthEntity>> logIn({
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
  void logOut() {
    _localDataSource.deleteAuthModel();
    _controller.add(AuthStatus.unauthenticated);
  }
}
