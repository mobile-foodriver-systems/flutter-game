import 'package:flutter/material.dart';
import 'package:food_driver/core/theme/theme_data.dart';

class CloseIconButton extends StatelessWidget {
  const CloseIconButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // return IconButton(
    //   onPressed: onPressed,
    //   icon: const Icon(Icons.close),
    // );
    return DecoratedBox(
      decoration: iconButtonDecoration,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.close),
      ),
    );
  }
}
