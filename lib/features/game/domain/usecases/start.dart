import 'package:food_driver/features/game/domain/repositories/game_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class StartUseCase {
  StartUseCase(this._gameRepository);

  final GameRepository _gameRepository;

  void call(int cityId) {
    _gameRepository.startGame(cityId: cityId);
  }
}
