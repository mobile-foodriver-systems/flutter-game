import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class NoTournament extends StatelessWidget {
  const NoTournament({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.tournamentEmpty.tr(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.red,
        ),
      ),
    );
  }
}
