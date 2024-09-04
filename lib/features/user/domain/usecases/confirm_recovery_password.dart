import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/domain/entities/confirm_recovery_params.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class ConfirmRecoveryPasswordUseCase
    implements UseCase<bool, ConfirmRecoveryParams> {
  final UserRepository _userRepository;

  const ConfirmRecoveryPasswordUseCase(
    this._userRepository,
  );

  @override
  Future<Either<Failure, bool>> call(ConfirmRecoveryParams params) async {
    return await _userRepository.confirmPasswordRecovery(
      email: params.email,
      code: params.code,
    );
  }
}
