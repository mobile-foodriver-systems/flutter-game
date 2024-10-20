import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class TournamentPrize extends StatelessWidget {
  const TournamentPrize({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.textFieldError,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                LocaleKeys.tournamentPrize.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: AppColors.markerDarkRed,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              LocaleKeys.tournamentPrizeValue.tr(namedArgs: {'currency': '\$'}),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20.0,
                    color: AppColors.markerDarkRed,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
