import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/data/models/game_action_result.dart';
import 'package:food_driver/features/game/domain/repositories/game_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class StartUseCase implements UseCase<GameActionResult, int> {
  StartUseCase(this._gameRepository);

  final GameRepository _gameRepository;

  @override
  Future<Either<Failure, GameActionResult>> call(int cityId) async {
    return await _gameRepository.startGame(cityId: cityId);
  }
}
