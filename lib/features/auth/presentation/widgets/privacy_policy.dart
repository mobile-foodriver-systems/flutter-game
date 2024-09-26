import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/constants/environment_constants.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/auth/presentation/pages/web_view_page.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: LocaleKeys.authPageAcceptPart.tr(),
        children: [
          TextSpan(
            text: "\n${LocaleKeys.authPagePrivacyPolicyPart.tr()}",
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebViewPage(
                        url: EnvironmentConstants().privacyPolicyUrl,
                        title: LocaleKeys.authPagePrivacyPolicy.tr(),
                      )
                  // PdfPage(
                  //       url: EnvironmentConstants().privacyPolicyUrl,
                  //       title: LocaleKeys.authPagePrivacyPolicy.tr(),
                  //     )
                  )),
            style: const TextStyle(
              shadows: [
                Shadow(
                  color: AppColors.midGray,
                  offset: Offset(0, -3),
                )
              ],
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.midGray,
            ),
          ),
        ],
      ),
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: AppColors.lightGray),
      textAlign: TextAlign.center,
    );
  }
}
