import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/fdc_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/l10n.dart';

class WinGame extends StatefulWidget {
  const WinGame({
    super.key,
    this.reward,
    required this.breakGame,
  });

  final num? reward;
  final VoidCallback breakGame;

  @override
  State<WinGame> createState() => _WinGameState();
}

class _WinGameState extends State<WinGame> {
  final _random = Random();
  final Set<String> winTextVariants = {
    S.current.gamePageWinText1,
    S.current.gamePageWinText2,
    S.current.gamePageWinText3,
    S.current.gamePageWinText4,
    S.current.gamePageWinText5,
    S.current.gamePageWinText6,
    S.current.gamePageWinText7,
    S.current.gamePageWinText8,
    S.current.gamePageWinText9,
    S.current.gamePageWinText10,
  }.whereType<String>().where((s) => s.isNotEmpty).toSet();
  String? winText;

  @override
  void initState() {
    winText = winTextVariants.isNotEmpty
        ? winTextVariants.elementAt(_random.nextInt(winTextVariants.length))
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 23.0, bottom: 15.0),
              child: Image.asset(AssetsCatalog.icFaceSmiling),
            ),
            Text(
              S.current.gamePageYouEarned,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              "+ ${(widget.reward ?? 0).fdc}",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 14.0),
            if (winText?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  winText!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.segmentedTextGray,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ElevatedButton(
              onPressed: widget.breakGame,
              child: Text(S.current.gamePagePlayMore),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
