import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class CheckAuthUseCase implements UseCase<(AuthEntity, UserEntity?), NoParams> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  const CheckAuthUseCase(
    this._authRepository,
    this._userRepository,
  );

  @override
  Future<Either<Failure, (AuthEntity, UserEntity?)>> call(NoParams _) async {
    AuthEntity? authEntity = await _authRepository.getAuthEntity();
    UserEntity? userEntity;
    if (authEntity?.isNotEmpty ?? false) {
      final response = await _userRepository.getUser();

      response.fold(
        (error) {
          return const Left(UnauthorizedServerFailure());
        },
        (success) async {
          userEntity = success;
          final newAuthEntity = await _authRepository.getAuthEntity();
          if (newAuthEntity == null) {
            return const Left(UnauthorizedServerFailure());
          }
          return Right(newAuthEntity);
        },
      );
      return Right((authEntity!, userEntity));
    }
    final auth = await _authRepository.initAuthEntity();
    Failure? e;
    auth.fold(
      (error) {
        e = error;
      },
      (success) {
        authEntity = success;
      },
    );
    if (e != null) {
      return const Left(UnauthorizedServerFailure());
    }
    return Right((authEntity!, userEntity));
  }
}
