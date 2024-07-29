part of 'package:food_driver/features/auth/presentation/widgets/registration_form.dart';

mixin RegistrationMixin on State<RegistrationForm> {
  GlobalKey<FormState> get formKey;
  TextEditingController get loginController;
  TextEditingController get passwordController;
  TextEditingController get repeatPasswordController;
  late final AuthBloc _bloc = context.read<AuthBloc>();

  void submit() {
    if (formKey.currentState!.validate()) {
      _bloc.add(AuthRegistrationEvent(
        login: loginController.text,
        password: passwordController.text,
      ));
    }
  }
}
