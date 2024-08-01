import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_driver/generated/l10n.dart';

part 'package:food_driver/features/auth/presentation/pages/mixins/registration_mixin.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm>
    with RegistrationMixin {
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  final TextEditingController loginController = TextEditingController();
  @override
  final TextEditingController passwordController = TextEditingController();
  @override
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 16.0),
            child: TextFormField(
              controller: loginController,
              keyboardType: TextInputType.text,
              autofillHints: const [AutofillHints.nickname],
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(S.current.authPageYourLogin),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.authPageUsername;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 16.0),
            child: TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(S.current.authPageYourPassword),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.authPagePassword;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 16.0),
            child: TextFormField(
              controller: repeatPasswordController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                label: Text(S.current.registrationPageYourPassword),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.authPagePassword;
                }
                if (value != passwordController.text) {
                  return S.current.registrationPagePasswordsDoNotMatch;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44.0),
            child: ElevatedButton(
              onPressed: submit,
              child: Text(S.current.registrationPageRegistration),
            ),
          ),
        ],
      ),
    );
  }
}
