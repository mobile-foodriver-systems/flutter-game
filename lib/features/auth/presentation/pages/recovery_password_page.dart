import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
import 'package:food_driver/features/auth/presentation/widgets/recovery_password_form.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PasswordRecoveryBloc>(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.passwordRecoveryPagePasswordRecovery.tr()),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 68.0),
            child: Column(
              children: [
                SizedBox(height: 49.0),
                RecoveryPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
