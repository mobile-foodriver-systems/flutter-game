import 'package:dartz/dartz.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/data/models/raiting_list.dart';
import 'package:food_driver/features/game/data/models/raiting_params.dart';
import 'package:food_driver/features/game/domain/repositories/game_repository.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadRaitingUseCase implements UseCase<RaitingList, RaitingParams> {
  final GameRepository _gameRepository;
  LoadRaitingUseCase(this._gameRepository);

  @override
  Future<Either<ApiErrorStack, RaitingList>> call(RaitingParams params) async {
    return await _gameRepository.loadRaitingList(
      radiusInKm: params.radiusInKm,
      limit: params.limit,
      offset: params.offset,
    );
  }
}
