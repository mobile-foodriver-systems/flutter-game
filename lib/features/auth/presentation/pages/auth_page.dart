import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/constants/config.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/auth/presentation/pages/confirmation_code_page.dart';
import 'package:food_driver/features/auth/presentation/pages/web_view_page.dart';
import 'package:food_driver/generated/l10n.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: scaffoldDecoration,
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Column(
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
                    const SizedBox(height: 8.0),
                    const AuthForm(),
                    const Spacer(flex: 56),
                    const _PrivacyPolicy(),
                    const Spacer(flex: 227),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Text(
            S.current.authPageUsername,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.gray),
          ),
          const SizedBox(height: 24),
          Padding(
            padding:
                const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 16.0),
            child: TextFormField(),
          ),
          Text(
            S.current.authPagePassword,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.gray),
          ),
          const SizedBox(height: 24),
          Padding(
            padding:
                const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 16.0),
            child: TextFormField(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44.0),
            child: ElevatedButton(
              onPressed: submit,
              child: Text(S.current.authPageLogin),
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ConfirmationCodePage(
              email: "test@test.ru",
            )));
  }
}

class _PrivacyPolicy extends StatelessWidget {
  const _PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: S.current.authPageAcceptPart,
        children: [
          TextSpan(
            text: S.current.authPagePrivacyPolicyPart,
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebViewPage(
                        url: Config.privacyPolicy,
                        title: S.current.authPagePrivacyPolicy,
                      ))),
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
