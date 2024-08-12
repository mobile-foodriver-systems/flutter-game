import 'package:food_driver/features/game/domain/repositories/game_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class SendTapUseCase {
  SendTapUseCase(this._gameRepository);

  final GameRepository _gameRepository;
  void call({
    required int currentSecond,
    required int tapCount,
  }) {
    if (tapCount > 0) {
      _gameRepository.moveOnRoute(
          clickTimeList: List.filled(
        tapCount,
        currentSecond,
      ));
    }
  }
}
