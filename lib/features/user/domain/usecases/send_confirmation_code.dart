import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class SendConfirmationCodeUseCase implements UseCase<bool, String> {
  final UserRepository _userRepository;

  const SendConfirmationCodeUseCase(
    this._userRepository,
  );

  @override
  Future<Either<Failure, bool>> call(String code) async {
    return await _userRepository.sendConfirmationCode(code: code);
  }
}
