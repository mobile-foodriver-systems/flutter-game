part of 'tournament_bloc.dart';

@freezed
class TournamentState with _$TournamentState {
  const factory TournamentState.loading() = _Loading;
  const factory TournamentState.empty() = _Empty;
  const factory TournamentState.tournament({
    required TournamentEntity tournament,
  }) = _Tournament;
  const factory TournamentState.finished({
    required TournamentEntity tournament,
  }) = _Finished;
  const factory TournamentState.error({
    required Failure failure,
  }) = _Error;
}
