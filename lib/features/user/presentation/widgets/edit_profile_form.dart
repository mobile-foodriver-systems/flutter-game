import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/services/email_confirmation/email_confirmation_service.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/presentation/widgets/email_field.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:food_driver/features/user/presentation/widgets/card_widget.dart';
import 'package:food_driver/features/user/presentation/widgets/changed_data_dialog.dart';
import 'package:food_driver/features/user/presentation/widgets/confirmation_code_dialog.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

part 'package:food_driver/features/user/presentation/pages/mixins/edit_profile_mixin.dart';

class EditProfileForm extends StatelessWidget {
  final VoidCallback changeEditingState;
  final UserEntity user;
  final VoidCallback loadProfile;
  final Future<void> Function({String? login, String? wallet}) updateProfile;

  const EditProfileForm({
    super.key,
    required this.changeEditingState,
    required this.user,
    required this.loadProfile,
    required this.updateProfile,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProfileBloc>(),
      child: EditProfileFormBody(
        changeEditingState: changeEditingState,
        user: user,
        loadProfile: loadProfile,
        updateProfile: updateProfile,
      ),
    );
  }
}

class EditProfileFormBody extends StatefulWidget {
  final VoidCallback changeEditingState;
  final UserEntity user;
  final VoidCallback loadProfile;
  final Future<void> Function({String? login, String wallet}) updateProfile;

  const EditProfileFormBody({
    super.key,
    required this.changeEditingState,
    required this.user,
    required this.loadProfile,
    required this.updateProfile,
  });

  @override
  State<EditProfileFormBody> createState() => _EditProfileFormBodyState();
}

class _EditProfileFormBodyState extends State<EditProfileFormBody>
    with EditProfileMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: listener,
      buildWhen: (previous, current) {
        if (previous != current) {
          return true;
        }
        return false;
      },
      builder: (BuildContext context, EditProfileState state) {
        return Stack(
          children: [
            CardWidget(
              alignment: Alignment.topLeft,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      LocaleKeys.profilePageInformation.tr(),
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: loginController,
                      keyboardType: TextInputType.text,
                      autofillHints: const [AutofillHints.username],
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        label: Text(
                          LocaleKeys.authPageYourLogin.tr(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.authPageUsername.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    EmailField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: walletController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        label: Text(
                          LocaleKeys.profilePageWallet.tr(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: submit,
                      child: Text(LocaleKeys.profilePageChangeData.tr()),
                    ),
                  ],
                ),
              ),
            ),
            if (state == const EditProfileState.loading())
              Positioned.fill(
                child: Container(
                  color: Colors.white.withOpacity(0.8),
                  child: const LoadingIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }
}
