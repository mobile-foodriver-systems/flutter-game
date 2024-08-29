import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/constants/environment_constants.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/auth/presentation/pages/confirmation_code_page.dart';
import 'package:food_driver/features/auth/presentation/pages/pdf_page.dart';
import 'package:food_driver/features/auth/presentation/widgets/email_field.dart';

class EmailAuthPage extends StatelessWidget {
  const EmailAuthPage({super.key});

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
                const SizedBox(height: 8.0),
                Text(
                  "Введите ваш E-mail",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.gray),
                ),
                const SizedBox(height: 24.0),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 44.0, bottom: 16.0, right: 44.0),
                  child: EmailField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ConfirmationCodePage(
                                email: "test@test.ru",
                              )));
                    }, // submit,
                    child: const Text("Войти"),
                  ),
                ),
                const Spacer(flex: 56),
                const _PrivacyPolicy(),
                const Spacer(flex: 327),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {}
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
                  builder: (context) => PdfPage(
                        url: EnvironmentConstants().privacyPolicyUrl,
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
