part of 'tournament_bloc.dart';

abstract class TournamentEvent extends Equatable {
  const TournamentEvent();

  @override
  List<Object> get props => [];
}

class LoadTournament extends TournamentEvent {
  const LoadTournament();
}
