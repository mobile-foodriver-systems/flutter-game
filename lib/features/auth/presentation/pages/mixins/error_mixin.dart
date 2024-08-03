import 'package:flutter/material.dart';
import 'package:food_driver/features/auth/data/models/registration_status.dart';
import 'package:food_driver/features/auth/presentation/bloc/registration/registration_bloc.dart';
import 'package:food_driver/features/auth/presentation/widgets/notification_message.dart';

mixin ErrorMixin {
  void errorListener(BuildContext context, RegistrationState state) {
    if ((state.error?.message?.isEmpty ?? true) ||
        state.status != RegistrationStatus.error) {
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
