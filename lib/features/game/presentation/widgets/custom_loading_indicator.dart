import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class CustomLoadingIndiacator extends StatelessWidget {
  const CustomLoadingIndiacator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gifBackground,
      child: Image.asset(AssetsCatalog.kangaroo),
    );
  }
}
