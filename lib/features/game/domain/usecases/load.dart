import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/domain/repositories/game_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadUseCase implements UseCase<List<DriveRouteEntity>, int> {
  final GameRepository _gameRepository;
  LoadUseCase(this._gameRepository);

  @override
  Future<Either<Failure, List<DriveRouteEntity>>> call(int cityId) async {
    return await _gameRepository.loadDriveRoutes(cityId: cityId);
  }
}
