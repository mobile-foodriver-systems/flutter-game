import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/base_auth_page.dart';
import 'package:food_driver/features/auth/presentation/pages/mixins/auth_mixin.dart';
import 'package:food_driver/features/auth/presentation/widgets/login_by_password.dart';

class AuthPage extends StatelessWidget with AuthMixin {
  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const AuthPage(),
      );

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: showMessage,
      builder: (BuildContext context, AuthState state) {
        return BaseAuthPage(
          isLoading: state.status == AuthStatus.loading,
          child: const LoginByPasswordState(),
        );
      },
    );
  }
}
