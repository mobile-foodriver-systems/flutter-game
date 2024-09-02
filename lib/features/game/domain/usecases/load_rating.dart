import 'package:dartz/dartz.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/data/models/rating_list.dart';
import 'package:food_driver/features/game/data/models/rating_params.dart';
import 'package:food_driver/features/game/domain/repositories/game_repository.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadRatingUseCase implements UseCase<RatingList, RatingParams> {
  final GameRepository _gameRepository;
  LoadRatingUseCase(this._gameRepository);

  @override
  Future<Either<ApiErrorStack, RatingList>> call(RatingParams params) async {
    return await _gameRepository.loadRatingList(
      radiusInKm: params.radiusInKm,
      limit: params.limit,
      offset: params.offset,
    );
  }
}
