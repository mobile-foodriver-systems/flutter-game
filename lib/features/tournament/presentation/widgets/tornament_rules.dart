import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/tournament/presentation/widgets/bordered_text.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_financing.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_fixed_sum.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class TournamentRules extends StatelessWidget {
  final double horizontalPaddingValue;
  final VoidCallback? participate;
  final VoidCallback? checkRating;

  const TournamentRules({
    super.key,
    required this.horizontalPaddingValue,
    this.participate,
    this.checkRating,
  });

  @override
  Widget build(BuildContext context) {
    final words = LocaleKeys.tournamentHundredBest.tr().split(' ');
    final color =
        "#${AppColors.red.value.toRadixString(16).replaceFirst('ff', '')}";
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsCatalog.tournamentBackground),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              LocaleKeys.tournamentRules.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            words.length > 3
                ? Text.rich(
                    TextSpan(
                      text: "${words.first} ${words[1]} ${words[2]} ",
                      children: [
                        TextSpan(
                          text: LocaleKeys.tournamentHundredBest
                              .tr()
                              .replaceFirst(
                                  "${words.first} ${words[1]} ${words[2]} ",
                                  ""),
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w600,
                        ),
                  )
                : Text(
                    LocaleKeys.tournamentHundredBest.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
            const SizedBox(height: 16.0),
            BorderedText(
              horizontalPaddingValue: horizontalPaddingValue,
              color: color,
            ),
            const SizedBox(height: 16.0),
            TournamentFixedSum(color: color),
            const SizedBox(height: 16.0),
            TournamentFinancing(color: color),
            const SizedBox(height: 24.0),
            if (participate != null)
              ElevatedButton(
                onPressed: participate,
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.tournamentParticipate.tr(),
                    ),
                    Text(
                      LocaleKeys.tournamentParticipateForPay
                          .tr(namedArgs: {"currency": "\$"}),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 11.0,
                            color: AppColors.white,
                          ),
                    ),
                  ],
                ),
              )
            else
              ElevatedButton(
                onPressed: checkRating,
                child: Text(
                  LocaleKeys.tournamentLeaderboard.tr(),
                ),
              ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
