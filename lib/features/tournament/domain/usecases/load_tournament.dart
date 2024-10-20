import 'package:dartz/dartz.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/tournament/data/models/tournament.dart';
import 'package:food_driver/features/tournament/domain/entities/tournament_entity.dart';
import 'package:food_driver/features/tournament/domain/repositories/tournament_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class LoadTournamentUseCase
    implements UseCase<List<TournamentEntity>, NoParams> {
  final TournamentRepository _tournamentRepository;
  LoadTournamentUseCase(this._tournamentRepository);

  @override
  Future<Either<Failure, List<TournamentEntity>>> call(NoParams params) async {
    final activeTournamentResult =
        await _tournamentRepository.activeTournament();
    final List<TournamentEntity> activeTournamentList =
        activeTournamentResult.fold(
      (_) => [],
      (result) => result.map((tournament) => tournament.toEntity()).toList(),
    );
    if (activeTournamentResult.isRight() && activeTournamentList.isNotEmpty) {
      return Right(activeTournamentList);
    }
    final completeTournamentResult =
        await _tournamentRepository.completedTournament();
    return completeTournamentResult.fold(
      (error) => Left(error),
      (result) => Right(
        result
            .map((tournament) => tournament.toEntity(isCompleted: true))
            .toList(),
      ),
    );
  }
}
