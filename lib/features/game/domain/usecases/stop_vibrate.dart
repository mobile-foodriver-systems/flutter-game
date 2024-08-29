import 'package:injectable/injectable.dart';
import 'package:vibration/vibration.dart';

@dev
@prod
@injectable
class StopVibrateUseCase {
  StopVibrateUseCase();

  void call() async {
    Vibration.cancel();
  }
}
