import 'package:flutter/material.dart';

class BaseAlertDialog extends StatelessWidget {
  final Widget child;

  const BaseAlertDialog({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: child,
      ),
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
    );
  }
}
