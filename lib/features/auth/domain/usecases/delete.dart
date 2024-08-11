import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class DeleteUseCase implements UseCase<Null, NoParams> {
  final AuthRepository _authRepository;
  const DeleteUseCase(this._authRepository);

  @override
  Future<Either<Failure, Null>> call(NoParams _) async {
    await _authRepository.delete();
    return const Right(null);
  }
}
