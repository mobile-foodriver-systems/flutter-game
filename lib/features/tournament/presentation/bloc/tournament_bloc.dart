import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/tournament/domain/entities/tournament_entity.dart';
import 'package:food_driver/features/tournament/domain/usecases/load_tournament.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tournament_bloc.freezed.dart';
part 'tournament_event.dart';
part 'tournament_state.dart';

@injectable
class TournamentBloc extends Bloc<TournamentEvent, TournamentState> {
  final LoadTournamentUseCase _loadRournament;
  TournamentBloc(this._loadRournament)
      : super(const TournamentState.loading()) {
    on<LoadTournament>(onLoadTournament);
  }

  void onLoadTournament(
    LoadTournament event,
    Emitter<TournamentState> emit,
  ) async {
    state.maybeMap(
      orElse: () {
        emit(const TournamentState.loading());
      },
      loading: null,
    );
    final result = await _loadRournament.call(NoParams());
    result.fold(
      (failure) {
        emit(TournamentState.error(failure: failure));
      },
      (tournaments) {
        if (tournaments.isEmpty) {
          emit(const TournamentState.empty());
          return;
        }
        final tournament = tournaments.first;
        if (tournament.isCompleted) {
          emit(TournamentState.finished(tournament: tournament));
          return;
        }
        emit(TournamentState.tournament(tournament: tournament));
      },
    );
  }
}
