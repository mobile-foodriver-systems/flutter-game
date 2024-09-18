import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/presentation/widgets/point.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class MultiTapButton extends StatelessWidget {
  const MultiTapButton({
    super.key,
    required this.callback,
  });

  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final buttonSize = size.width * 0.53;
    return RawGestureDetector(
      gestures: {
        MultiTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<MultiTapGestureRecognizer>(
          MultiTapGestureRecognizer.new,
          (MultiTapGestureRecognizer instance) {
            instance.onTapUp = (index, details) {
              _getTapPosition(context, details, size, buttonSize);
              callback?.call();
            };
          },
        ),
      },
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: const BoxDecoration(
          color: AppColors.red,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AssetsCatalog.icFinger),
            const SizedBox(height: 8.0),
            Text.rich(
              TextSpan(
                text: LocaleKeys.gamePageTapToGo.tr(),
                children: [
                  TextSpan(
                    text: "\n${LocaleKeys.gamePageTapToGoSecondPart.tr()}",
                  ),
                ],
              ),
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
    );
  }

  void _getTapPosition(
    BuildContext context,
    TapUpDetails details,
    Size screenSize,
    double buttonSize,
  ) {
    Offset position = Offset.zero;
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    position = referenceBox.globalToLocal(details.globalPosition);
    Point().showOverlay(
      context,
      position: position,
      screenSize: screenSize,
      buttonSize: buttonSize,
    );
  }
}
