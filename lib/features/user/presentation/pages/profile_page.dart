import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/constants/environment_constants.dart';
import 'package:food_driver/core/extensions/fdc_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/pdf_page.dart';
import 'package:food_driver/features/game/presentation/pages/error_page.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/features/user/data/models/user_status.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:food_driver/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:food_driver/features/user/presentation/pages/game_rules_page.dart';
import 'package:food_driver/features/user/presentation/widgets/card_widget.dart';
import 'package:food_driver/features/user/presentation/widgets/close_icon_button.dart';
import 'package:food_driver/features/user/presentation/widgets/custom_text_button.dart';
import 'package:food_driver/features/user/presentation/widgets/edit_profile_form.dart';
import 'package:food_driver/features/user/presentation/widgets/profile_info.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

part 'package:food_driver/features/user/presentation/pages/mixins/profile_mixin.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>(),
      child: const ProfileBody(),
    );
  }
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> with ProfileMixin {
  static const double horizontalPaddingValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        if (state.status == UserStatus.error) {
          return const ErrorPage();
        }
        return Scaffold(
          backgroundColor: AppColors.surfaceBackground,
          body: SafeArea(
            child: state.status == UserStatus.loading
                ? const LoadingIndicator()
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: horizontalPaddingValue),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40.0, bottom: 16.0),
                                child: Image.asset(AssetsCatalog.roundedLogo),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: CloseIconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: _LanguageSwitcher(),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            LocaleKeys.profilePageYourBalance.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textGray,
                                ),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Center(
                          child: Text(
                            state.user!.balance.fdc,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        isEditing
                            ? EditProfileForm(
                                changeEditingState: changeEditingState,
                                user: state.user!,
                                loadProfile: loadProfile,
                                updateProfile: updateProfile,
                              )
                            : ProfileInfo(
                                user: state.user!,
                                changeData: changeEditingState,
                              ),
                        const SizedBox(height: 8.0),
                        const _LegalInfo(),
                        const SizedBox(height: 24.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: horizontalPaddingValue),
                          child: ElevatedButton(
                            onPressed: logout,
                            child: Text(LocaleKeys.profilePageLogout.tr()),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: horizontalPaddingValue),
                          child: TextButton(
                            onPressed: deleteAccount,
                            child: Text(
                              LocaleKeys.profilePageDeleteAccount.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
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
            LocaleKeys.profilePageLegal.tr(),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16.0),
          CustomTextButton(
            text: LocaleKeys.profilePageGameRules.tr(),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const GameRulesPage())),
          ),
          CustomTextButton(
            text: LocaleKeys.authPagePrivacyPolicy.tr(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PdfPage(
                      url: EnvironmentConstants().privacyPolicyUrl,
                      title: LocaleKeys.authPagePrivacyPolicy.tr(),
                    ))),
          ),
        ],
      ),
    );
  }
}

class _LanguageSwitcher extends StatefulWidget {
  @override
  State<_LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<_LanguageSwitcher> {
  late List<Locale> locales = context.supportedLocales;
  late Locale selectedLanguage = context.locale;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: selectedLanguage,
      items: locales
          .map((e) => DropdownMenuItem<Locale>(
                value: e,
                child: Text(e.languageCode),
              ))
          .toList(),
      onChanged: setLocale,
    );
  }

  void setLocale(Locale? value) {
    if (value != null && selectedLanguage != value) {
      selectedLanguage = value;
      context.setLocale(value);
    }
  }
}
