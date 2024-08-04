import 'package:dartz/dartz.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/data/models/auth_error.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/entities/auth_params.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoginByPasswordUseCase implements UseCase<AuthEntity, AuthParams> {
  final AuthRepository _authRepository;
  const LoginByPasswordUseCase(this._authRepository);

  @override
  Future<Either<AuthError, AuthEntity>> call(AuthParams params) async {
    return await _authRepository.loginByPassword(
      login: params.login,
      password: params.password,
    );
  }
}
