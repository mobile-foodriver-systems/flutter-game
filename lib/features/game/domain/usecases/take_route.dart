import 'package:food_driver/features/game/domain/repositories/game_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class TakeRouteUseCase {
  TakeRouteUseCase(this._gameRepository);

  final GameRepository _gameRepository;

  void call(int routeId) {
    _gameRepository.takeRoute(routeId: routeId);
  }
}
