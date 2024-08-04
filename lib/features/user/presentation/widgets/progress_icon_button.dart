import 'package:flutter/material.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/presentation/pages/raiting_list_page.dart';

class ProgressIconButton extends StatelessWidget {
  const ProgressIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: iconButtonDecoration,
      child: IconButton(
        color: AppColors.white,
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RaitingListPage())),
        icon: Image.asset(AssetsCatalog.icCup),
      ),
    );
  }
}
