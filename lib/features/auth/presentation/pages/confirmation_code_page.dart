import 'package:flutter/material.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/auth/presentation/widgets/countdown_text_button.dart';
import 'package:food_driver/features/game/presentation/pages/game_page.dart';
// import 'package:pinput/pinput.dart';

class ConfirmationCodePage extends StatefulWidget {
  const ConfirmationCodePage({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<ConfirmationCodePage> createState() => _ConfirmationCodePageState();
}

class _ConfirmationCodePageState extends State<ConfirmationCodePage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: scaffoldDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 51),
              Image.asset(AssetsCatalog.logo),
              const Spacer(flex: 56),
              Text(
                "Код подтверждения",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                "Отправили на ${widget.email}",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.gray),
              ),
              const SizedBox(height: 24.0),
              const SizedBox(height: 52),
              // Pinput(
              //   defaultPinTheme: defaultPinTheme,
              //   controller: _controller,
              //   onCompleted: (pin) => print(pin),
              //   focusNode: focusNode,
              // ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44.0),
                child: ElevatedButton(
                  // onPressed: confirmCode,
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const GamePage()),
                      (_) => false),
                  child: const Text("Подтвердить"),
                ),
              ),
              const Spacer(flex: 56),
              CountdownTextButton(
                duration: const Duration(minutes: 1),
                callback: resendCode,
              ),
              const Spacer(flex: 311),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resendCode() async {}

  Future<void> confirmCode() async {}
}
