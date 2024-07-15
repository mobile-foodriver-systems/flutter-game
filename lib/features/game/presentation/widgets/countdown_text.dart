import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class CountdownText extends StatefulWidget {
  const CountdownText({
    super.key,
    required this.seconds,
    required this.callback,
  });

  final int seconds;
  final VoidCallback callback;

  @override
  State<CountdownText> createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText> {
  int _seconds = 0;
  late final Timer timer;

  @override
  void initState() {
    _seconds = widget.seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds == 0) {
        timer.cancel();
        widget.callback();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Text(
          "Старт через: $_seconds",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
