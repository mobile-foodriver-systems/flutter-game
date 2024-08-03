import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/features/auth/presentation/widgets/login_password_auth_form.dart';
import 'package:food_driver/features/auth/presentation/widgets/privacy_policy.dart';
import 'package:food_driver/generated/l10n.dart';

class LoginByPasswordState extends StatelessWidget {
  const LoginByPasswordState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(flex: 51),
        Image.asset(AssetsCatalog.logo),
        const Spacer(flex: 56),
        Text(
          S.current.authPageLoginToAccount,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24.0),
        const LoginPasswordAuthForm(),
        const Spacer(flex: 56),
        const PrivacyPolicy(),
        const Spacer(flex: 227),
      ],
    );
  }
}
