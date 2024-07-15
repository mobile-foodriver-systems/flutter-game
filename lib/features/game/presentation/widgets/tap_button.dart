import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class TapButton extends StatelessWidget {
  const TapButton({
    super.key,
    required this.callback,
  });

  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.53,
        height: MediaQuery.sizeOf(context).width * 0.53,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.red,
            shape: BoxShape.circle,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AssetsCatalog.icFinger),
                const SizedBox(height: 8.0),
                const Text(
                  "Кликай\nчтобы ехать",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
