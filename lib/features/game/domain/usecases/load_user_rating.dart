import 'package:dartz/dartz.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/data/models/rating_list.dart';
import 'package:food_driver/features/game/domain/repositories/game_repository.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadUserRatingUseCase implements UseCase<RatingList, NoParams> {
  final GameRepository _gameRepository;
  LoadUserRatingUseCase(this._gameRepository);

  @override
  Future<Either<ApiErrorStack, RatingList>> call(NoParams _) async {
    return await _gameRepository.loadRatingList(
      limit: null,
      offset: null,
    );
  }
}
