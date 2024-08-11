import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/fdc_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/generated/l10n.dart';

class WinGame extends StatelessWidget {
  const WinGame({
    super.key,
    this.reward,
  });

  final num? reward;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 23.0, bottom: 15.0),
          child: Image.asset(AssetsCatalog.icFaceSmiling),
        ),
        Text(
          S.current.gamePageYouEarned,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                "+ ${(reward ?? 0).fdc}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Image.asset(
              AssetsCatalog.roundedLogo,
              width: 40.0,
              height: 40.0,
            ),
          ],
        ),
        const Spacer(flex: 160),
        SizedBox(
          width: 162.0,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(S.current.gamePagePlayMore),
          ),
        ),
        const Spacer(flex: 140),
      ],
    );
  }
}
