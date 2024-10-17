import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/presentation/widgets/card_widget.dart';
import 'package:food_driver/features/user/presentation/widgets/disabled_field.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class ProfileInfo extends StatelessWidget {
  final UserEntity user;
  final VoidCallback changeData;

  const ProfileInfo({
    super.key,
    required this.user,
    required this.changeData,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            LocaleKeys.profilePageInformation.tr(),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16.0),
          DisabledField(
            label: LocaleKeys.profilePageLogin.tr(),
            value: user.userName ?? "",
          ),
          const SizedBox(height: 16.0),
          DisabledField(
            label: LocaleKeys.profilePageEmail.tr(),
            value: user.email ?? "",
          ),
          const SizedBox(height: 16.0),
          if (!Platform.isIOS) ...[
            DisabledField(
              label: LocaleKeys.profilePageWallet.tr(),
              value: user.walletAddress ?? "",
            ),
            const SizedBox(height: 16.0),
          ],
          ElevatedButton(
            style: elevatedButtonGrayStyle,
            onPressed: changeData,
            child: Text(
              LocaleKeys.profilePageChangeData.tr(),
            ),
          )
        ],
      ),
    );
  }
}
