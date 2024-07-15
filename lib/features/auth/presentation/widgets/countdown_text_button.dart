import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/duration_formatter.dart';

class CountdownTextButton extends StatefulWidget {
  const CountdownTextButton({
    super.key,
    required this.duration,
    required this.callback,
  });

  final Duration duration;
  final VoidCallback callback;

  @override
  State<CountdownTextButton> createState() => _CountdownTextButtonState();
}

class _CountdownTextButtonState extends State<CountdownTextButton> {
  int _seconds = 0;
  Timer? timer;

  @override
  void initState() {
    initTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _seconds == 0
          ? () {
              widget.callback();
              initTimer();
              setState(() {});
            }
          : null,
      child: Text(_seconds == 0
          ? "Отправить повторно"
          : "Отправить повторно (${Duration(seconds: _seconds).mSS})"),
    );
  }

  void initTimer() {
    _seconds = widget.duration.inSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds == 0) {
        timer?.cancel();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
