part of 'package:food_driver/features/auth/presentation/widgets/registration_form.dart';

mixin RegistrationMixin on State<RegistrationForm> {
  GlobalKey<FormState> get formKey;
  TextEditingController get loginController;
  TextEditingController get passwordController;
  TextEditingController get repeatPasswordController;
  late final RegistrationBloc _registrationBloc =
      context.read<RegistrationBloc>();
  late final AuthBloc _authBloc = context.read<AuthBloc>();

  void submit() {
    if (formKey.currentState!.validate()) {
      _registrationBloc.add(AuthRegistrationEvent(
        login: loginController.text,
        password: passwordController.text,
        doLogin: () => _authBloc.add(
          AuthLoginByPasswordEvent(
            login: loginController.text,
            password: passwordController.text,
          ),
        ),
      ));
    }
  }
}
