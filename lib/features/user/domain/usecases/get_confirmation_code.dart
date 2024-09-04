import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class GetConfirmationCodeUseCase implements UseCase<bool, String> {
  final UserRepository _userRepository;

  const GetConfirmationCodeUseCase(
    this._userRepository,
  );

  @override
  Future<Either<Failure, bool>> call(String email) async {
    return await _userRepository.getConfirmationCode(email: email);
  }
}
