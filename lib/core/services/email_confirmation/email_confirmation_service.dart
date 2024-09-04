import 'dart:async';

import 'package:food_driver/constants/duration_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmailConfirmationService {
  EmailConfirmationService();

  Timer? timer;
  int seconds = 0;

  void start() {
    if (timer != null) return;
    seconds = DurationConstants.emailConfirmation.inSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), timerCallback);
  }

  void timerCallback(Timer timer) {
    if (seconds == 0) {
      timer.cancel();
      return;
    }
    seconds--;
  }
}
