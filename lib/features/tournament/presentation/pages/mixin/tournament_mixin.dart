part of 'package:food_driver/features/tournament/presentation/pages/tournament_page.dart';

mixin TournamentMixin on State<TournamentBody> {
  late final TournamentBloc _bloc = context.read<TournamentBloc>();

  @override
  void initState() {
    _bloc.add(const LoadTournament());
    super.initState();
  }

  void participate() {}

  void checkRating() {}
}
