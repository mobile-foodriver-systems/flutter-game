import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/constants/config.dart';
import 'package:food_driver/core/extensions/fdt_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_driver/features/game/presentation/pages/error_page.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/features/user/data/models/user_status.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/presentation/bloc/user_bloc.dart';
import 'package:food_driver/features/user/presentation/widgets/card_widget.dart';
import 'package:food_driver/features/user/presentation/widgets/close_icon_button.dart';
import 'package:food_driver/features/user/presentation/widgets/custom_text_button.dart';
import 'package:food_driver/features/user/presentation/widgets/disabled_field.dart';
import 'package:food_driver/generated/l10n.dart';

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
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            S.current.profilePageYourBalance,
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
                            state.user!.balance.fdt,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        _ProfileInfo(user: state.user!),
                        const SizedBox(height: 8.0),
                        const _LegalInfo(),
                        const SizedBox(height: 24.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: horizontalPaddingValue),
                          child: ElevatedButton(
                            onPressed: logout,
                            child: Text(S.current.profilePageLogout),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextButton(
                          onPressed: deleteAccount,
                          child: Text(S.current.profilePageDeleteAccount),
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

class _ProfileInfo extends StatelessWidget {
  final UserEntity user;

  const _ProfileInfo({
    super.key,
    required this.user,
  });

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
            S.current.profilePageInformation,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16.0),
          DisabledField(
            label: S.current.profilePageEmail,
            value: user.email ?? "",
          ),
          const SizedBox(height: 16.0),
          DisabledField(
            label: S.current.profilePageWallet,
            value: user.walletAddress ?? "",
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
            S.current.profilePageLegal,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16.0),
          CustomTextButton(
            text: S.current.profilePageOfferAgreement,
            url: Config.offerAgreement,
          ),
          CustomTextButton(
            text: S.current.authPagePrivacyPolicy,
            url: Config.privacyPolicy,
          ),
        ],
      ),
    );
  }
}
