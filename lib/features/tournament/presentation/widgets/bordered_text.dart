import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class BorderedText extends StatelessWidget {
  final double horizontalPaddingValue;
  final String color;

  const BorderedText({
    super.key,
    required this.horizontalPaddingValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final dashWidth =
        (MediaQuery.sizeOf(context).width - horizontalPaddingValue * 2) / 6;
    final text = LocaleKeys.tournamentPrizePercents.tr(namedArgs: {
      "first_percent": LocaleKeys.tournamentFirstPercent.tr(),
      "second_percent": LocaleKeys.tournamentSecondPercent.tr(),
    });

    var htmlText = text.replaceFirst(LocaleKeys.tournamentFirstPercent.tr(),
        '<b><span style="color: $color">${LocaleKeys.tournamentFirstPercent.tr()}</span></b>');
    htmlText = htmlText.replaceFirst(LocaleKeys.tournamentSecondPercent.tr(),
        '<b><span style="color: $color">${LocaleKeys.tournamentSecondPercent.tr()}</span></b>');
    return DottedBorder(
      color: AppColors.red,
      strokeWidth: 1,
      borderType: BorderType.RRect,
      dashPattern: [dashWidth, dashWidth],
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: Image.asset(AssetsCatalog.icFdrivers),
          ),
          Flexible(
            child: HtmlWidget(htmlText),
          ),
        ],
      ),
    );
  }
}
