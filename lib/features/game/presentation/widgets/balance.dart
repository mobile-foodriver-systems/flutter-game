import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/fdc_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class Balance extends StatelessWidget {
  const Balance({
    super.key,
    required this.callback,
    required this.balance,
  });

  final VoidCallback? callback;
  final num? balance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.asset(
                AssetsCatalog.roundedLogo,
                width: 28.0,
                height: 28.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                (balance ?? 0).fdc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
