import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class TournamentError extends StatelessWidget {
  final Failure failure;

  const TournamentError({
    super.key,
    required this.failure,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.message ?? LocaleKeys.gamePageSomethingWrong.tr(),
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
