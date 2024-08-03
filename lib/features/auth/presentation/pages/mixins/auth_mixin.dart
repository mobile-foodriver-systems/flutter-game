import 'package:flutter/material.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/widgets/notification_message.dart';
import 'package:food_driver/features/game/presentation/pages/game_page.dart';

mixin AuthMixin {
  void showMessage(BuildContext context, AuthState state) {
    if (state.status == AuthStatus.authenticated) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const GamePage()),
          (_) => false);
      return;
    }
    if ((state.error?.message?.isEmpty ?? true) ||
        state.status != AuthStatus.unauthenticated) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: NotificationMessage(
            message: state.error!.message!,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
