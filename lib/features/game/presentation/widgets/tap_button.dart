import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/l10n.dart';

class TapButton extends StatelessWidget {
  const TapButton({
    super.key,
    required this.callback,
  });

  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.53;
    return ClipOval(
      child: Material(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(width),
        child: InkWell(
          onTap: callback,
          splashColor: AppColors.blackRed,
          splashFactory: InkSparkle.splashFactory,
          child: SizedBox(
            width: width,
            height: width,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AssetsCatalog.icFinger),
                  const SizedBox(height: 8.0),
                  Text(
                    S.current.gamePageTapToGo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
      ),
    );
  }
}
