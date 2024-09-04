import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/features/auth/presentation/widgets/email_field.dart';
import 'package:food_driver/features/user/presentation/widgets/card_widget.dart';
import 'package:food_driver/features/user/presentation/widgets/changed_data_dialog.dart';
import 'package:food_driver/features/user/presentation/widgets/confirmation_code_dialog.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

part 'package:food_driver/features/user/presentation/pages/mixins/edit_profile_mixin.dart';

class EditProfileForm extends StatefulWidget {
  final VoidCallback changeEditingState;
  const EditProfileForm({
    super.key,
    required this.changeEditingState,
  });

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm>
    with EditProfileMixin {
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  final TextEditingController loginController = TextEditingController();
  @override
  final TextEditingController emailController = TextEditingController();
  @override
  final TextEditingController walletController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      alignment: Alignment.topLeft,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              LocaleKeys.profilePageInformation.tr(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.left,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.profilePageWallet.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: changeData,
              child: Text(LocaleKeys.profilePageChangeData.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
