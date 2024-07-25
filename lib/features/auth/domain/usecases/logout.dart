import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LogoutUseCase implements UseCase<Null, AuthEntity> {
  final AuthRepository _authRepository;
  const LogoutUseCase(this._authRepository);

  @override
  Future<Either<Failure, Null>> call(AuthEntity params) async {
    await _authRepository.logout(auth: params);
    return const Right(null);
  }
}
