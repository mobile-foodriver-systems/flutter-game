import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class CheckAuthUseCase implements UseCase<AuthEntity, NoParams> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  const CheckAuthUseCase(
    this._authRepository,
    this._userRepository,
  );

  @override
  Future<Either<Failure, AuthEntity>> call(NoParams _) async {
    final authEntity = await _authRepository.getAuthEntity();
    if (authEntity?.isNotEmpty ?? false) {
      final response = await _userRepository.getUser();
      response.fold(
        (error) {
          return const Left(UnauthorizedServerFailure());
        },
        (success) async {
          final newAuthEntity = await _authRepository.getAuthEntity();
          if (newAuthEntity == null) {
            return const Left(UnauthorizedServerFailure());
          }
          return Right(newAuthEntity);
        },
      );
      return Right(authEntity!);
    }
    return await _authRepository.initAuthEntity();
  }
}
