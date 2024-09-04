import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/time_formatter.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';
import 'package:pinput/pinput.dart';

part 'package:food_driver/features/user/presentation/pages/mixins/confirm_email_mixin.dart';

class ConfirmationCodeDialog extends StatefulWidget {
  final String email;
  final int seconds;
  final Function(String email) resendCode;

  const ConfirmationCodeDialog({
    super.key,
    required this.email,
    required this.seconds,
    required this.resendCode,
  });

  @override
  State<ConfirmationCodeDialog> createState() => _ConfirmationCodeDialogState();
}

class _ConfirmationCodeDialogState extends State<ConfirmationCodeDialog>
    with ConfirmEmailMixin {
  @override
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  late Timer timer;
  int _seconds = 0;

  @override
  void initState() {
    _seconds = widget.seconds;
    timer = Timer.periodic(const Duration(seconds: 1), timerCallback);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 44.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            LocaleKeys.profilePageConfirmationCode.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            LocaleKeys.profilePageSentTo.tr(namedArgs: {
              'email': widget.email,
            }),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.focusedBorder,
                ),
          ),
          const SizedBox(height: 24.0),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            controller: controller,
            // onCompleted: (pin) => print(pin),
            focusNode: focusNode,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: confirm,
            child: Text(LocaleKeys.profilePageConfirm.tr()),
          ),
          TextButton(
            onPressed: () => widget.resendCode(widget.email),
            child: Text(
              _seconds == 0
                  ? LocaleKeys.profilePageResend
                      .tr()
                      .replaceAll('( {time})', '')
                  : LocaleKeys.profilePageResend.tr(namedArgs: {
                      'time': TimeFormatter.formatDuration(_seconds),
                    }),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void timerCallback(Timer timer) {
    if (_seconds == 0) {
      timer.cancel();
      return;
    }
    _seconds--;
    setState(() {});
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
