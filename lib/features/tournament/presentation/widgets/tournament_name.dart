import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/tournament/presentation/pages/tournament_page.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class TournamentName extends StatelessWidget {
  final String? name;
  const TournamentName({
    super.key,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: horizontalPaddingValue,
        right: horizontalPaddingValue,
        bottom: 28.0,
      ),
      child: Text(
        name ?? LocaleKeys.tournamentName.tr(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontSize: 15.0,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
