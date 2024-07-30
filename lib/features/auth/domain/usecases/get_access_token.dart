import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class GetAccessTokenUseCase implements UseCase<AuthEntity, NoParams> {
  final AuthRepository _authRepository;

  const GetAccessTokenUseCase(
    this._authRepository,
  );

  @override
  Future<Either<Failure, AuthEntity>> call(NoParams _) async {
    return await _authRepository.initAuthEntity();
  }
}
