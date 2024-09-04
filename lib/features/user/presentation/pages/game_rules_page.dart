import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class GameRulesPage extends StatelessWidget {
  const GameRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.profilePageGameRules.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 26.0, right: 26.0, bottom: 26.0),
        child: Text(LocaleKeys.profilePageGameRulesText.tr()),
      ),
    );
  }
}
