import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/tournament/domain/entities/tournament_entity.dart';
import 'package:food_driver/features/tournament/presentation/pages/tournament_page.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_name.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_prize.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class TournamentWinner extends StatelessWidget {
  final TournamentEntity tournament;
  final VoidCallback checkRating;

  const TournamentWinner({
    super.key,
    required this.tournament,
    required this.checkRating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TournamentName(name: tournament.name),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
          child: TournamentPrize(),
        ),
        const SizedBox(height: 40.0),
        Text(
          LocaleKeys.tournamentIsOver.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20.0),
        Image.asset(
          AssetsCatalog.capWithBackground,
          width: 211.0,
          height: 181.0,
        ),
        const SizedBox(height: 20.0),
        Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.56,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.textFieldGray,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "username",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 17.0,
                            color: AppColors.red,
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      tournament.topUserCount.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
          child: ElevatedButton(
            onPressed: checkRating,
            child: Text(
              LocaleKeys.tournamentLeaderboard.tr(),
            ),
          ),
        ),
      ],
    );
  }
}
