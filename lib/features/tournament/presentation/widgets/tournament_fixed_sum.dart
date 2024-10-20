import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class TournamentFixedSum extends StatelessWidget {
  final String color;
  const TournamentFixedSum({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = LocaleKeys.tournamentFixedSum.tr(namedArgs: {
      "sum": LocaleKeys.tournamentPrizeValueString.tr(),
      "token_name": LocaleKeys.tokenName.tr(),
      "ecosystem": LocaleKeys.ecosystem.tr(),
    });
    final words = text.split(' ');
    final firstPhrase = words.length >= 2 ? "${words[0]} ${words[1]}" : "";
    var htmlText = firstPhrase.isNotEmpty
        ? text.replaceFirst(firstPhrase,
            '<b><span style="color: $color">$firstPhrase</span></b>')
        : text;
    htmlText = htmlText.replaceFirst(LocaleKeys.tournamentPrizeValueString.tr(),
        '<b>${LocaleKeys.tournamentPrizeValueString.tr()}</b>');
    htmlText = htmlText.replaceFirst(
        LocaleKeys.tokenName.tr(), '<b>${LocaleKeys.tokenName.tr()}</b>');
    htmlText = htmlText.replaceFirst(
        LocaleKeys.ecosystem.tr(), '<b>${LocaleKeys.ecosystem.tr()}</b>');
    return HtmlWidget(htmlText);
  }
}
