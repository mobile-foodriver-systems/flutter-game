import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class HelpGameMessage extends StatelessWidget {
  const HelpGameMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.white,
            ),
            const SizedBox(width: 10.0),
            Text(
              "Жмите на точки для начала игры",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
