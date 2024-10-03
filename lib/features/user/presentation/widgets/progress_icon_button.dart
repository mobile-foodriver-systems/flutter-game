import 'package:flutter/material.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class ProgressIconButton extends StatelessWidget {
  const ProgressIconButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: iconButtonDecoration,
      child: IconButton(
        color: AppColors.white,
        onPressed: onPressed,
        icon: Image.asset(AssetsCatalog.icCup),
      ),
    );
  }
}
