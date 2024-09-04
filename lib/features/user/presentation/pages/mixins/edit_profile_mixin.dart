part of 'package:food_driver/features/user/presentation/widgets/edit_profile_form.dart';

mixin EditProfileMixin on State<EditProfileFormBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController walletController = TextEditingController();
  late final EditProfileBloc _bloc = context.read<EditProfileBloc>();
  final emailConfirmationService = getIt<EmailConfirmationService>();

  @override
  void initState() {
    loginController.text = widget.user.userName ?? '';
    emailController.text = widget.user.email ?? '';
    walletController.text = widget.user.walletAddress ?? '';
    super.initState();
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      if (!(emailConfirmationService.timer?.isActive ?? false)) {
        _bloc.add(ChangeDataBeginEvent(email: emailController.text));
      } else {
        openConfirmationDialog();
      }
    }
  }

  void listener(BuildContext context, EditProfileState state) async {
    if (state == const EditProfileState.codeSent()) {
      openConfirmationDialog();
    } else if (state == const EditProfileState.confirmed()) {
      Navigator.of(context).pop();
      showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ChangedDataDialog(
                dataChanged: widget.changeEditingState,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
          );
        },
      );
    }
  }

  void openConfirmationDialog() async {
    emailConfirmationService.start();
    showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ConfirmationCodeDialog(
              email: emailController.text,
              seconds: emailConfirmationService.seconds,
              resendCode: (email) =>
                  _bloc.add(ChangeDataBeginEvent(email: email)),
              confirmEmail: (code) =>
                  _bloc.add(ConfirmChangeDataEvent(code: code)),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
        );
      },
    );
  }
}
