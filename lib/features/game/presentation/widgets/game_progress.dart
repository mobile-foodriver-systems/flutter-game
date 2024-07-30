import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/time_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/l10n.dart';

class GameProgress extends StatefulWidget {
  const GameProgress({
    super.key,
    this.speed,
    required this.seconds,
    required this.looseGame,
  });

  final num? speed;
  final int seconds;
  final VoidCallback looseGame;

  @override
  State<GameProgress> createState() => _GameProgressState();
}

class _GameProgressState extends State<GameProgress> {
  int _seconds = 0;
  late final Timer timer;

  @override
  void initState() {
    _seconds = widget.seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds == 0) {
        timer.cancel();
        widget.looseGame();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsCatalog.icStopwatch),
            const SizedBox(width: 4.0),
            Text(
              TimeFormatter.formatDuration(_seconds),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.red,
                  ),
            ),
            const SizedBox(width: 12.0),
            Text(
              S.current
                  .gamePageTapSpeed((widget.speed ?? 0).toStringAsFixed(1)),
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

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
