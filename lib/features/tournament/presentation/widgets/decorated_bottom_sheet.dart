import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class DecoratedBottomSheet extends StatelessWidget {
  final Widget child;

  const DecoratedBottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 6.0),
            Center(
              child: SizedBox(
                height: 4.0,
                width: 36.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.bottomSheetHelper,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6.0),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
