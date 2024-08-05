import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class SetUserUseCase implements UseCaseWatchable<UserEntity, UserEntity> {
  final UserRepository _userRepository;

  const SetUserUseCase(
    this._userRepository,
  );

  @override
  Stream<UserEntity> call(UserEntity user) {
    return _userRepository.addUserToStream(user: user);
  }
}
