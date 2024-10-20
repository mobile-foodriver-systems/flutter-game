import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/features/tournament/presentation/bloc/tournament_bloc.dart';
import 'package:food_driver/features/tournament/presentation/widgets/decorated_bottom_sheet.dart';
import 'package:food_driver/features/tournament/presentation/widgets/no_tournament.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_error.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_widget.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_winner.dart';

part 'package:food_driver/features/tournament/presentation/pages/mixin/tournament_mixin.dart';

const double horizontalPaddingValue = 20.0;

class TournamentPage extends StatelessWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TournamentBloc>(),
      child: const TournamentBody(),
    );
  }
}

class TournamentBody extends StatefulWidget {
  const TournamentBody({super.key});

  @override
  State<TournamentBody> createState() => _TournamentBodyState();
}

class _TournamentBodyState extends State<TournamentBody> with TournamentMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentBloc, TournamentState>(
      builder: (context, state) {
        return DecoratedBottomSheet(
          child: state.map(
            empty: (empty) {
              return const NoTournament();
            },
            loading: (loading) {
              return const LoadingIndicator();
            },
            tournament: (state) {
              return TournamentWidget(
                tournament: state.tournament,
                participate: participate,
                checkRating: checkRating,
              );
            },
            finished: (state) {
              return TournamentWinner(
                tournament: state.tournament,
                checkRating: checkRating,
              );
            },
            error: (error) {
              return TournamentError(failure: error.failure);
            },
          ),
        );
      },
    );
  }
}
