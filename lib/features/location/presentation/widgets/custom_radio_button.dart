import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isActive;
  const CustomRadioButton({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          border: Border.all(
            color: AppColors.activeRadioRed,
            width: 5.0,
          ),
        ),
        child: const SizedBox(
          width: 16,
          height: 16,
        ),
      );
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.radioBorder,
        ),
      ),
      child: const SizedBox(
        width: 16,
        height: 16,
      ),
    );
  }
}
