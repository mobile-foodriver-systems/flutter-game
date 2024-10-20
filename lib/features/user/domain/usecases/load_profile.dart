import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadProfileUseCase implements UseCase<UserEntity, NoParams> {
  final UserRepository _userRepository;

  const LoadProfileUseCase(
    this._userRepository,
  );

  @override
  Future<Either<Failure, UserEntity>> call(NoParams _) async {
    return await _userRepository.getUser();
  }
}
