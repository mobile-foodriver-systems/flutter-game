import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/presentation/widgets/prize_fund_bottom_sheet.dart';
import 'package:food_driver/generated/locale_keys.g.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PrizeFund extends StatelessWidget {
  const PrizeFund({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black26,
        builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: const PrizeFundBottomSheet(),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: SizedBox(
          height: 65.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.dividerLightGray),
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LogosCollage(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          LocaleKeys.gamePagePrizeFund.tr(),
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                        ),
                        Text(
                          LocaleKeys.gamePageShortDescription.tr(),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 25),
                  child: Image.asset(AssetsCatalog.icArrowRight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogosCollage extends StatelessWidget {
  const LogosCollage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.0,
      width: 75.0,
      child: Stack(
        children: [
          PositionedDirectional(
            top: -9,
            start: -6,
            child: Image.asset(
              AssetsCatalog.roundedLogo,
              width: 50,
              height: 50,
            ),
          ),
          PositionedDirectional(
            top: 44.0,
            start: 2.0,
            child: Image.asset(
              AssetsCatalog.roundedLogo,
              width: 17,
              height: 17,
            ),
          ),
          PositionedDirectional(
            top: 2.0,
            start: 49.0,
            child: Image.asset(
              AssetsCatalog.roundedLogo,
              width: 21,
              height: 21,
            ),
          ),
          PositionedDirectional(
            top: 40.0,
            start: 31.0,
            child: Image.asset(
              AssetsCatalog.roundedLogo,
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
