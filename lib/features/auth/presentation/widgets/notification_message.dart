import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class NotificationMessage extends StatelessWidget {
  const NotificationMessage({
    super.key,
    required this.message,
    this.backgroundColor = AppColors.black,
    this.textColor = AppColors.white,
  });

  final String message;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
