import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/time_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/l10n.dart';

class GameProgress extends StatelessWidget {
  const GameProgress({
    super.key,
    this.speed,
    required this.seconds,
  });

  final num? speed;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final redFlag = [0, 2, 4, 6, 8, 10].any((i) => i == seconds);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: redFlag ? AppColors.red : AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsCatalog.icStopwatch,
              color: redFlag ? AppColors.white : AppColors.red,
            ),
            const SizedBox(width: 4.0),
            Text(
              TimeFormatter.formatDuration(seconds),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: redFlag ? AppColors.white : AppColors.red,
                  ),
            ),
            const SizedBox(width: 12.0),
            Text(
              S.current.gamePageTapSpeed((speed ?? 0).toStringAsFixed(1)),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
