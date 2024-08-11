import 'package:dartz/dartz.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:food_driver/features/user/domain/entities/update_user_params.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class UpdateUserUseCase implements UseCase<NoParams, UpdateUserParams> {
  final UserRepository _userRepository;

  const UpdateUserUseCase(
    this._userRepository,
  );

  @override
  Future<Either<ApiErrorStack, NoParams>> call(UpdateUserParams params) async {
    return await _userRepository.updateUser(
      cityId: params.cityId,
      email: params.email,
      walletAddress: params.walletAddress,
    );
  }
}
