import 'package:flutter/material.dart';
import 'package:food_driver/constants/config.dart';
import 'package:food_driver/core/extensions/fdt_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/profile/presentation/widgets/card_widget.dart';
import 'package:food_driver/features/profile/presentation/widgets/close_icon_button.dart';
import 'package:food_driver/features/profile/presentation/widgets/custom_text_button.dart';
import 'package:food_driver/features/profile/presentation/widgets/disabled_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const double horizontalPaddingValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPaddingValue),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 16.0),
                      child: Image.asset(AssetsCatalog.roundedLogo),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CloseIconButton(
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "Ваш баланс",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGray,
                      ),
                ),
              ),
              const SizedBox(height: 4.0),
              Center(
                child: Text(
                  17.04.fdt,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 40.0),
              const _ProfileInfo(),
              const SizedBox(height: 8.0),
              const _LegalInfo(),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPaddingValue),
                child: ElevatedButton(
                  onPressed: logout,
                  child: const Text("Выйти из аккаунта"),
                ),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: deleteAccount,
                child: const Text("Удалить аккаунт"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {}

  Future<void> deleteAccount() async {}
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      // TODO: fix design - bad padding
      // padding: const EdgeInsets.symmetric(horizontal: 25.5, vertical: 24.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Данные",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16.0),
          const DisabledField(
            label: "Почта",
            value: "test@test.ru",
          ),
          const SizedBox(height: 16.0),
          const DisabledField(
            label: "Кошелек",
            value: "xkjbsddjhavsbhbxasdasdaxasasdx",
          ),
        ],
      ),
    );
  }
}

class _LegalInfo extends StatelessWidget {
  const _LegalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Юридическое",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16.0),
          const CustomTextButton(
            text: "Договор оферты",
            url: Config.offerAgreement,
          ),
          const CustomTextButton(
            text: "Политика конфиденциальности",
            url: Config.privacyPolicy,
          ),
        ],
      ),
    );
  }
}
