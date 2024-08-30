import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/time_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class LooseGame extends StatefulWidget {
  final double? progress;
  final int? totalTime;
  final VoidCallback breakGame;

  const LooseGame({
    super.key,
    this.totalTime,
    this.progress,
    required this.breakGame,
  });

  @override
  State<LooseGame> createState() => _LooseGameState();
}

class _LooseGameState extends State<LooseGame> {
  final _random = Random();
  final Set<String> looseTextVariants = {
    LocaleKeys.gamePageLooseText1.tr(),
    LocaleKeys.gamePageLooseText2.tr(),
    LocaleKeys.gamePageLooseText3.tr(),
    LocaleKeys.gamePageLooseText4.tr(),
    LocaleKeys.gamePageLooseText5.tr(),
    LocaleKeys.gamePageLooseText6.tr(),
    LocaleKeys.gamePageLooseText7.tr(),
    LocaleKeys.gamePageLooseText8.tr(),
    LocaleKeys.gamePageLooseText9.tr(),
    LocaleKeys.gamePageLooseText10.tr(),
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
              LocaleKeys.gamePageSorry.tr(),
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
            ElevatedButton(
              onPressed: widget.breakGame,
              child: Text(
                LocaleKeys.gamePageDeliverAnother.tr(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
