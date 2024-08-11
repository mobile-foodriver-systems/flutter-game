import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/l10n.dart';

class LooseGame extends StatelessWidget {
  const LooseGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 23.0, bottom: 7.0),
          child: Image.asset(AssetsCatalog.icFaceFrown),
        ),
        Text(
          S.current.gamePageSorry,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.red),
        ),
        const Spacer(flex: 160),
        Center(
          child: SizedBox(
            width: 224.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.textFieldGray,
                foregroundColor: AppColors.black,
              ),
              child: Text(S.current.gamePageTryAgain),
            ),
          ),
        ),
        const Spacer(flex: 140),
      ],
    );
  }
}
