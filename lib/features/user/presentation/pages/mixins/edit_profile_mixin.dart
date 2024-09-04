part of 'package:food_driver/features/user/presentation/widgets/edit_profile_form.dart';

mixin EditProfileMixin on State<EditProfileFormBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController walletController = TextEditingController();
  late final EditProfileBloc _bloc = context.read<EditProfileBloc>();
  final emailConfirmationService = EmailConfirmationService();

  @override
  void initState() {
    loginController.text = widget.user.userName ?? '';
    emailController.text = widget.user.email ?? '';
    walletController.text = widget.user.walletAddress ?? '';
    super.initState();
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      _bloc.add(ChangeDataBeginEvent(email: emailController.text));
    }
  }

  void listener(BuildContext context, EditProfileState state) async {
    if (state == const EditProfileState.codeSent()) {
      emailConfirmationService.start();
      final result = await showDialog<bool>(
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
              ),
            ),
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
          );
        },
      );
      if (result ?? false) {
        await showDialog<bool>(
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
  }
}
