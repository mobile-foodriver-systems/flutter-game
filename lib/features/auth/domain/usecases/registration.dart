import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_params.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class RegistrationUseCase implements UseCase<NoParams, AuthParams> {
  final AuthRepository _authRepository;
  const RegistrationUseCase(this._authRepository);

  @override
  Future<Either<Failure, NoParams>> call(AuthParams params) async {
    return await _authRepository.registration(
      login: params.login,
      password: params.password,
    );
  }
}
