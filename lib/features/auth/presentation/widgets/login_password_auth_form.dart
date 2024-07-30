import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/registration_page.dart';
import 'package:food_driver/generated/l10n.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 44.0, right: 44.0, bottom: 16.0),
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
                  padding: const EdgeInsets.only(
                      left: 44.0, right: 44.0, bottom: 16.0),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
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
                  padding: const EdgeInsets.only(
                      left: 44.0, right: 44.0, bottom: 16.0),
                  child: ElevatedButton(
                    onPressed: submit,
                    child: Text(S.current.authPageLogin),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegistrationPage()));
                    },
                    child: Text(S.current.authPageRegister),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
