import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class CheckAuthUseCase {
  final AuthRepository _authRepository;
  const CheckAuthUseCase(this._authRepository);

  Future<AuthEntity?> call() async {
    return await _authRepository.getAuthEntity();
  }
}
