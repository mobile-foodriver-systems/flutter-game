import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class PrizeFundBottomSheet extends StatelessWidget {
  const PrizeFundBottomSheet({super.key});

  static const double horizontalPaddingValue = 20.0;

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
          const SizedBox(height: 6.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
            child: Text(
              LocaleKeys.tournamentName.tr(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    fontSize: 15.0,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 28.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
            child: TournamentPrize(),
          ),
          const SizedBox(height: 32.0),
          const Padding(
            padding: EdgeInsetsDirectional.only(end: horizontalPaddingValue),
            child: TournamentInfo(),
          ),
          const SizedBox(height: 32.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
            child: AllWin(),
          ),
          const SizedBox(height: 28.0),
          const TournamentRules(
            horizontalPaddingValue: horizontalPaddingValue,
          ),
        ],
      ),
    );
  }
}

class TournamentNamedValue extends StatelessWidget {
  final String title;
  final String value;
  const TournamentNamedValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.red,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class TournamentPrize extends StatelessWidget {
  const TournamentPrize({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.textFieldError,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                LocaleKeys.tournamentPrize.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: AppColors.markerDarkRed,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              LocaleKeys.tournamentPrizeValue.tr(namedArgs: {'currency': '\$'}),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20.0,
                    color: AppColors.markerDarkRed,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

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

class TournamentRules extends StatelessWidget {
  final double horizontalPaddingValue;
  const TournamentRules({
    super.key,
    required this.horizontalPaddingValue,
  });

  @override
  Widget build(BuildContext context) {
    final words = LocaleKeys.tournamentHundredBest.tr().split(' ');
    final dashWidth =
        (MediaQuery.sizeOf(context).width - horizontalPaddingValue * 2) / 6;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsCatalog.tournamentBackground),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              LocaleKeys.tournamentRules.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            words.length > 3
                ? Text.rich(
                    TextSpan(
                      text: "${words.first} ${words[1]} ${words[2]} ",
                      children: [
                        TextSpan(
                          text: LocaleKeys.tournamentHundredBest
                              .tr()
                              .replaceFirst(
                                  "${words.first} ${words[1]} ${words[2]} ",
                                  ""),
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w600,
                        ),
                  )
                : Text(
                    LocaleKeys.tournamentHundredBest.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
            const SizedBox(height: 16.0),
            DottedBorder(
              color: AppColors.red,
              strokeWidth: 1,
              borderType: BorderType.RRect,
              dashPattern: [dashWidth, dashWidth],
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: Image.asset(AssetsCatalog.icFdrivers),
                  ),
                  Flexible(
                    child:
                        // Text.rich(
                        //   TextSpan(
                        //     text: LocaleKeys.tournamentFirstPercent.tr(),
                        //     children: [
                        //       TextSpan(
                        //         text: LocaleKeys.tournamentFirstPercent.tr(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Text(
                      LocaleKeys.tournamentPrizePercents.tr(namedArgs: {
                        "first_percent": LocaleKeys.tournamentFirstPercent.tr(),
                        "second_percent":
                            LocaleKeys.tournamentSecondPercent.tr(),
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              LocaleKeys.tournamentFixedSum.tr(namedArgs: {
                "sum": LocaleKeys.tournamentPrizeValueString.tr(),
                "token_name": LocaleKeys.tokenName.tr(),
                "ecosystem": LocaleKeys.ecosystem.tr(),
              }),
            ),
            const SizedBox(height: 16.0),
            Text(
              LocaleKeys.tournamentFinancing.tr(namedArgs: {
                "company_name": LocaleKeys.companyName.tr(),
                "game_name": LocaleKeys.gameName.tr(),
                "token_name": LocaleKeys.tokenName.tr(),
              }),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                LocaleKeys.tournamentLeaderboard.tr(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Column(
                children: [
                  Text(
                    LocaleKeys.tournamentParticipate.tr(),
                  ),
                  Text(
                    LocaleKeys.tournamentParticipateForPay
                        .tr(namedArgs: {"currency": "\$"}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
