import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/constants/environment_constants.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: S.current.authPageAcceptPart,
        children: [
          TextSpan(
            text: S.current.authPagePrivacyPolicyPart,
            recognizer: TapGestureRecognizer()..onTap = _launchUrl,
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

  Future<void> _launchUrl() async {
    final uri = Uri.tryParse(EnvironmentConstants.privacyPolicyUrl);
    if (uri == null) return;
    launchUrl(uri);
  }
}
