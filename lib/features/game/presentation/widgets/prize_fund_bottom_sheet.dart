import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class PrizeFundBottomSheet extends StatelessWidget {
  const PrizeFundBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
            const SizedBox(height: 8.0),
            Text(
              LocaleKeys.gamePagePrizeFund.tr(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    fontSize: 17.0,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.textFieldGray,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.gamePageAmount.tr(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${LocaleKeys.gamePageAmountValue.tr()} FDC",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 20.0,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 56.0),
            Text(
              LocaleKeys.gamePagePrizeFundText.tr(),
            ),
            const SizedBox(height: 56.0),
          ],
        ),
      ),
    );
  }
}
