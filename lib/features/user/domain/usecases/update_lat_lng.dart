import 'package:dartz/dartz.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:food_driver/features/user/domain/entities/update_user_lat_lng_params.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class UpdateUserLatLngUseCase
    implements UseCase<NoParams, UpdateUserLatLngParams> {
  final UserRepository _userRepository;

  const UpdateUserLatLngUseCase(
    this._userRepository,
  );

  @override
  Future<Either<ApiErrorStack, NoParams>> call(
      UpdateUserLatLngParams params) async {
    return await _userRepository.updateUserLatLng(
      latitude: params.latLng.latitude,
      longitude: params.latLng.longitude,
    );
  }
}
