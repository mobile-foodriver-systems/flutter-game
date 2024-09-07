part of 'package:food_driver/features/auth/presentation/widgets/recovery_password_form.dart';

mixin RecoveryPasswordMixin on State<RecoveryPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final passwordConfirmationService = getIt<PasswordConfirmationService>();

  late final PasswordRecoveryBloc _bloc = context.read<PasswordRecoveryBloc>();

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      if (!(passwordConfirmationService.timer?.isActive ?? false)) {
        _bloc.add(ChangePasswordBeginEvent(
          email: emailController.text,
          newPassword: passwordController.text,
        ));
      } else {
        openConfirmationDialog();
      }
    }
  }

  void listener(BuildContext context, PasswordRecoveryState state) async {
    if (state == const PasswordRecoveryState.codeSent()) {
      openConfirmationDialog();
    } else if (state == const PasswordRecoveryState.confirmed()) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AuthPage()),
          (_) => false);
      showDialog<bool>(
        context: context,
        builder: (context) {
          return const BaseAlertDialog(child: ChangedDataDialog());
        },
      );
    }
  }

  void openConfirmationDialog() async {
    passwordConfirmationService.start();
    showDialog<bool>(
      context: context,
      builder: (context) {
        final password = passwordController.text;
        final email = emailController.text;
        return BaseAlertDialog(
          child: ConfirmationCodeDialog(
            email: emailController.text,
            seconds: passwordConfirmationService.seconds,
            resendCode: (email) => _bloc.add(ChangePasswordBeginEvent(
              email: email,
              newPassword: password,
            )),
            confirmEmail: (code) => _bloc.add(ConfirmPasswordChangeEvent(
              email: email,
              code: code,
            )),
          ),
        );
      },
    );
  }
}
