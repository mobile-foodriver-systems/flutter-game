part of 'package:food_driver/features/auth/presentation/widgets/login_password_auth_form.dart';

mixin LoginPasswordMixin on State<LoginPasswordAuthForm> {
  GlobalKey<FormState> get formKey;
  
  void submit() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ConfirmationCodePage(
              email: "test@test.ru",
            )));
    if (formKey.currentState!.validate()) {
      
    }
  }
}
