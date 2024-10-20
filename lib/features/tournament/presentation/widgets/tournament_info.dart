import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/features/tournament/presentation/widgets/tournament_named_value.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class TournamentInfo extends StatelessWidget {
  const TournamentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 12),
          child: Image.asset(AssetsCatalog.icCap),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TournamentNamedValue(
                title: LocaleKeys.tournamentBegin.tr(),
                value: '10.10.2024',
              ),
              const Divider(),
              TournamentNamedValue(
                title: LocaleKeys.tournamentEnd.tr(),
                value: '11.10.2024',
              ),
              const Divider(),
              TournamentNamedValue(
                title: LocaleKeys.tournamentBeforeTheStart.tr(),
                value: '10:00:00',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
