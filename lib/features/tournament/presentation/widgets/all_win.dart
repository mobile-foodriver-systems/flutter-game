import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class AllWin extends StatelessWidget {
  const AllWin({super.key});

  @override
  Widget build(BuildContext context) {
    final words = LocaleKeys.tournamentAllWin.tr().split(' ');
    return Stack(
      fit: StackFit.passthrough,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 108),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16.0,
                    end: 137.0,
                    top: 15.0,
                    bottom: 15.0,
                  ),
                  child: words.length > 2
                      ? Text.rich(
                          TextSpan(
                            text: "${words.first} ${words[1]} ",
                            children: [
                              TextSpan(
                                text: LocaleKeys.tournamentAllWin
                                    .tr()
                                    .replaceFirst(
                                        "${words.first} ${words[1]} ", ""),
                                style:
                                    const TextStyle(color: AppColors.textColor),
                              ),
                            ],
                          ),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                        )
                      : Text(
                          LocaleKeys.tournamentAllWin.tr(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.red,
                                  ),
                        ),
                ),
              ),
            ),
          ),
        ),
        Positioned.directional(
          textDirection: Directionality.of(context),
          bottom: 0,
          end: 0,
          child: Image.asset(AssetsCatalog.kangarooWithPhone),
        ),
      ],
    );
  }
}
