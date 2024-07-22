import 'package:flutter/material.dart';

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
      decoration: const InputDecoration(
        label: Text("Ваша почта"),
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
