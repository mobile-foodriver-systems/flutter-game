part of 'package:food_driver/features/auth/presentation/widgets/login_password_auth_form.dart';

mixin LoginPasswordMixin on State<LoginPasswordAuthForm> {
  GlobalKey<FormState> get formKey;
  TextEditingController get loginController;
  TextEditingController get passwordController;
  late final AuthBloc _bloc = context.read<AuthBloc>();

  void submit() {
    if (formKey.currentState!.validate()) {
      _bloc.add(AuthLoginByPasswordEvent(
        login: loginController.text,
        password: passwordController.text,
      ));
    }
  }
}
