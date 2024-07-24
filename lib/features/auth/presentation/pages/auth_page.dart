import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/constants/config.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/auth/presentation/pages/confirmation_code_page.dart';
import 'package:food_driver/features/auth/presentation/pages/web_view_page.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 51),
                Image.asset(AssetsCatalog.logo),
                const Spacer(flex: 56),
                Text(
                  "Вход в аккаунт",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(flex: 8),
                const Flexible(
                  child: AuthForm(),
                ),
                const Spacer(flex: 56),
                const _PrivacyPolicy(),
                const Spacer(flex: 227),
              ],
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
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 204, maxHeight: 284),
      child: Form(
        child: Column(
          children: [
            Text(
              "Введите логин",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.gray),
            ),
            const Spacer(flex: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44.0),
              child: TextFormField(),
            ),
            const Spacer(flex: 16),
            Text(
              "Введите пароль",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.gray),
            ),
            const Spacer(flex: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44.0),
              child: TextFormField(),
            ),
            const Spacer(flex: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44.0),
              child: ElevatedButton(
                onPressed: submit,
                child: const Text("Войти"),
              ),
            ),
          ],
        ),
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
        text: "Нажимая «Войти», Вы принимаете условия\n",
        children: [
          TextSpan(
            text: "политики конфиденциальности",
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WebViewPage(
                        url: Config.privacyPolicy,
                        title: "Политика конфиденциальности",
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
