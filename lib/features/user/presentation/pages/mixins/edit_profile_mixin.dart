part of 'package:food_driver/features/user/presentation/widgets/edit_profile_form.dart';

mixin EditProfileMixin on State<EditProfileForm> {
  GlobalKey<FormState> get formKey;
  TextEditingController get loginController;
  TextEditingController get emailController;
  TextEditingController get walletController;

  Future<void> changeData() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ConfirmationCodeDialog(email: emailController.text),
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
        );
      },
    );
    if (result ?? false) {
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
}
