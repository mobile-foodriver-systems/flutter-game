import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/domain/entities/recovery_params.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class RecoveryPasswordUseCase implements UseCase<bool, RecoveryParams> {
  final UserRepository _userRepository;

  const RecoveryPasswordUseCase(
    this._userRepository,
  );

  @override
  Future<Either<Failure, bool>> call(RecoveryParams params) async {
    return await _userRepository.recoveryPassword(
      email: params.email,
      password: params.password,
    );
  }
}
