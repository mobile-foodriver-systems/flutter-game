import 'package:injectable/injectable.dart';
import 'package:vibration/vibration.dart';

@dev
@prod
@injectable
class VibrateUseCase {
  VibrateUseCase();

  void call() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 50);
    }
  }
}
