import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class TournamentFinancing extends StatelessWidget {
  final String color;
  const TournamentFinancing({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = LocaleKeys.tournamentFinancing.tr(namedArgs: {
      "company_name": LocaleKeys.companyName.tr(),
      "game_name": LocaleKeys.gameName.tr(),
      "token_name": LocaleKeys.tokenName.tr(),
    });
    final words = text.split(" ");
    final firstPhrase =
        words.length >= 3 ? "${words[0]} ${words[1]} ${words[2]}" : "";
    var htmlText = firstPhrase.isNotEmpty
        ? text.replaceFirst(firstPhrase,
            '<b><span style="color: $color">$firstPhrase</span></b>')
        : text;
    htmlText = htmlText.replaceFirst(
        LocaleKeys.companyName.tr(), '<b>${LocaleKeys.companyName.tr()}</b>');
    htmlText = htmlText.replaceFirst(
        LocaleKeys.gameName.tr(), '<b>${LocaleKeys.gameName.tr()}</b>');
    htmlText = htmlText.replaceFirst(
        LocaleKeys.tokenName.tr(), '<b>${LocaleKeys.tokenName.tr()}</b>');
    return HtmlWidget(htmlText);
  }
}
