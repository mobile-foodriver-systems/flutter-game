import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_driver/features/auth/domain/usecases/login_by_password.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class RegistrationUseCase implements UseCase<AuthEntity, AuthParams> {
  final AuthRepository _authRepository;
  const RegistrationUseCase(this._authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthParams params) async {
    final response = await _authRepository.registration(
      login: params.login,
      password: params.password,
    );
    return response.fold(
      (error) {
        return Left(error);
      },
      (result) async {
        return await _authRepository.loginByPassword(
          login: params.login,
          password: params.password,
        );
      },
    );
  }
}
