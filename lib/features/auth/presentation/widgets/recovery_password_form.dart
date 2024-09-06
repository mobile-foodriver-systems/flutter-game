import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/services/password_confirmation_service/password_confirmation_service.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/auth_page.dart';
import 'package:food_driver/features/auth/presentation/widgets/email_field.dart';
import 'package:food_driver/features/user/presentation/widgets/changed_data_dialog.dart';
import 'package:food_driver/features/user/presentation/widgets/confirmation_code_dialog.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

part 'package:food_driver/features/auth/presentation/pages/mixins/recovery_password_mixin.dart';

class RecoveryPasswordForm extends StatefulWidget {
  const RecoveryPasswordForm({super.key});

  @override
  State<RecoveryPasswordForm> createState() => _RecoveryPasswordFormState();
}

class _RecoveryPasswordFormState extends State<RecoveryPasswordForm>
    with RecoveryPasswordMixin {
 
  @override
  final TextEditingController passwordController = TextEditingController();
  @override
  final TextEditingController emailController = TextEditingController();
  @override
  final TextEditingController repeatPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordRecoveryBloc, PasswordRecoveryState>(
      listener: listener,
      builder: (BuildContext context, PasswordRecoveryState state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              EmailField(
                controller: emailController,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.password],
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  label: Text(
                    LocaleKeys.passwordRecoveryPageNewPassword.tr(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.passwordRecoveryPageEnterPassword.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: repeatPasswordController,
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.password],
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  label: Text(
                    LocaleKeys.passwordRecoveryPageRepeatPassword.tr(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.passwordRecoveryPageEnterPassword.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: submit,
                child: Text(LocaleKeys.passwordRecoveryPageChange.tr()),
              ),
            ],
          ),
        );
      },
    );
  }
}
