import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoginByPasswordUseCase implements UseCase<AuthEntity, AuthParams> {
  final AuthRepository _authRepository;
  const LoginByPasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthParams params) async {
    return await _authRepository.loginByPassword(
      login: params.login,
      password: params.password,
    );
  }
}

class AuthParams extends Equatable {
  final String login;
  final String password;

  const AuthParams({
    required this.login,
    required this.password,
  });

  @override
  List<Object?> get props => [
        login,
        password,
      ];
}
