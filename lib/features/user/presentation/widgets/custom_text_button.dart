import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(
                text,
                style: const TextStyle(color: AppColors.black),
                maxLines: 2,
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: AppColors.arrowRightGray,
          ),
        ],
      ),
    );
  }
}
