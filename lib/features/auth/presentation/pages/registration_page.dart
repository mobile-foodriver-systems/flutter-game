import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/constants/config.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/web_view_page.dart';
import 'package:food_driver/features/auth/presentation/widgets/registration_form.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/generated/l10n.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
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
                                S.current.registrationPageRegistration,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 24.0),
                              const RegistrationForm(),
                              const Spacer(flex: 56),
                              const _PrivacyPolicy(),
                              const Spacer(flex: 227),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state.status == AuthStatus.loading)
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.5),
                      ),
                      child: const LoadingIndicator(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
