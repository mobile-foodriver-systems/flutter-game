import 'package:flutter/material.dart';
import 'package:food_driver/features/tournament/domain/entities/tournament_entity.dart';
import 'package:food_driver/features/tournament/presentation/pages/tournament_page.dart';
import 'package:food_driver/features/tournament/presentation/widgets/all_win.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tornament_rules.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_info.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_name.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_prize.dart';

class TournamentWidget extends StatelessWidget {
  final TournamentEntity tournament;
  final VoidCallback participate;
  final VoidCallback checkRating;

  const TournamentWidget({
    super.key,
    required this.tournament,
    required this.participate,
    required this.checkRating,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          TournamentName(name: tournament.name),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
            child: TournamentPrize(),
          ),
          const SizedBox(height: 32.0),
          const Padding(
            padding: EdgeInsetsDirectional.only(end: horizontalPaddingValue),
            child: TournamentInfo(),
          ),
          const SizedBox(height: 32.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
            child: AllWin(),
          ),
          const SizedBox(height: 28.0),
          TournamentRules(
            horizontalPaddingValue: horizontalPaddingValue,
            participate: tournament.isParticipant ? null : participate,
            checkRating: tournament.isParticipant ? checkRating : null,
          ),
        ],
      ),
    );
  }
}
