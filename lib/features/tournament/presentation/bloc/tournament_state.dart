part of 'tournament_bloc.dart';

abstract class TournamentState extends Equatable {
  const TournamentState();  

  @override
  List<Object> get props => [];
}
class TournamentInitial extends TournamentState {}
