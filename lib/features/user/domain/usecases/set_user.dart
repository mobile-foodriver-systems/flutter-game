import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class SetUserUseCase implements UseCase<NoParams, UserEntity> {
  final UserRepository _userRepository;

  const SetUserUseCase(
    this._userRepository,
  );

  @override
  Future<Either<Failure, NoParams>> call(UserEntity user) async {
    _userRepository.setUser(user: user);
    return Right(NoParams());
  }
}
