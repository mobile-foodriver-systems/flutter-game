part of 'package:food_driver/features/auth/presentation/widgets/recovery_password_form.dart';

mixin RecoveryPasswordMixin on State<RecoveryPasswordForm> {
  GlobalKey<FormState> get formKey;
  TextEditingController get emailController;
  TextEditingController get passwordController;
  TextEditingController get repeatPasswordController;

  Future<void> submit() async {
    
  }
}
