import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/time_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/l10n.dart';

class LooseGame extends StatefulWidget {
  final double? progress;
  final int? totalTime;

  const LooseGame({
    super.key,
    this.totalTime,
    this.progress,
  });

  @override
  State<LooseGame> createState() => _LooseGameState();
}

class _LooseGameState extends State<LooseGame> {
  final _random = Random();
  final Set<String> looseTextVariants = {
    S.current.gamePageLooseText1,
    S.current.gamePageLooseText2,
    S.current.gamePageLooseText3,
    S.current.gamePageLooseText4,
    S.current.gamePageLooseText5,
    S.current.gamePageLooseText6,
    S.current.gamePageLooseText7,
    S.current.gamePageLooseText8,
    S.current.gamePageLooseText9,
    S.current.gamePageLooseText10,
  }.whereType<String>().where((s) => s.isNotEmpty).toSet();

  String? looseText;

  late final int firstSegment = ((widget.progress ?? 0) * 100).toInt();
  late final int secondSegment = 100 - firstSegment;

  @override
  void initState() {
    looseText = looseTextVariants.isNotEmpty
        ? looseTextVariants.elementAt(_random.nextInt(looseTextVariants.length))
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final timeTextStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          color: AppColors.segmentedTextGray,
        );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 2,
          color: AppColors.red,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 23.0, bottom: 7.0),
              child: Image.asset(AssetsCatalog.icFaceFrown),
            ),
            Text(
              S.current.gamePageSorry,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            if (looseText?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                  looseText!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TimeFormatter.formatDuration(
                      ((widget.totalTime ?? 0) * (widget.progress ?? 0))
                          .toInt()),
                  style: timeTextStyle,
                ),
                Text(
                  TimeFormatter.formatDuration(widget.totalTime ?? 0),
                  style: timeTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 3.0),
            Row(
              children: [
                Expanded(
                  flex: firstSegment,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(color: AppColors.red),
                    child: SizedBox(
                      height: 3.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: secondSegment,
                  child: const DecoratedBox(
                    decoration:
                        BoxDecoration(color: AppColors.segmentedTextGray),
                    child: SizedBox(
                      height: 3.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
