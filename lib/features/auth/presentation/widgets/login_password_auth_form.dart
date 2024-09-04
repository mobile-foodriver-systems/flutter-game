import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/registration_page.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

part 'package:food_driver/features/auth/presentation/pages/mixins/login_password_mixin.dart';

class LoginPasswordAuthForm extends StatefulWidget {
  const LoginPasswordAuthForm({super.key});

  @override
  State<LoginPasswordAuthForm> createState() => _LoginPasswordAuthFormState();
}

class _LoginPasswordAuthFormState extends State<LoginPasswordAuthForm>
    with LoginPasswordMixin {
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  final TextEditingController loginController = TextEditingController();
  @override
  final TextEditingController passwordController = TextEditingController();

  final EdgeInsets horizontalPadding = const EdgeInsets.only(
    left: 44.0,
    right: 44.0,
    bottom: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: horizontalPadding,
              child: TextFormField(
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
            ),
            Padding(
              padding: horizontalPadding,
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  label: Text(LocaleKeys.authPageYourPassword.tr()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.authPagePassword.tr();
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: horizontalPadding,
              child: ElevatedButton(
                onPressed: submit,
                child: Text(LocaleKeys.authPageLogin.tr()),
              ),
            ),
            Padding(
              padding: horizontalPadding,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegistrationPage(),
                  ));
                },
                child: Text(LocaleKeys.authPageRegister.tr()),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 44.0),
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const RecoveryPasswordPage(),
            //       ));
            //     },
            //     child: Text(LocaleKeys.authPageRecoverPassword.tr()),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
