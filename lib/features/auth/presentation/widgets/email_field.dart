import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.controller,
    this.textInputAction = TextInputAction.done,
  });

  final TextEditingController? controller;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(LocaleKeys.passwordRecoveryPageYourEmail.tr()),
      ),
      controller: controller,
      textInputAction: textInputAction,
      validator: (value) => EmailValidator().validate(
        value,
        error: "Укажите адрес электронной почты",
      ),
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
    );
  }
}

class EmailValidator {
  String? validate(
    String? value, {
    required String error,
  }) {
    if (value?.trim().isEmpty ?? true) {
      return error;
    }
    if (!value!.contains('@') ||
        !value.contains('.') ||
        value.contains(',') ||
        value.trim().contains(' ')) {
      return error;
    }
    return null;
  }
}
