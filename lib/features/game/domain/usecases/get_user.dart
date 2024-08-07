import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class GetUserUseCase implements UseCaseWatchable<UserEntity?, NoParams> {
  final UserRepository _userRepository;

  GetUserUseCase(
    this._userRepository,
  );

  @override
  Stream<UserEntity?> call(NoParams _) {
    return _userRepository.userFromStream();
  }
}
