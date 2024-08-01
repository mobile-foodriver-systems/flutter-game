import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class BreakAccessTokenUseCase implements UseCase<bool, NoParams> {
  final AuthRepository _authRepository;
  BreakAccessTokenUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams _) async {
    await _authRepository.breakAccessToken();
    return const Right(true);
  }
}
