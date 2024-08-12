import 'package:food_driver/core/services/signal_r/signal_r_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod])
class AppSignalRService extends SignalRService {
  AppSignalRService({required super.authRepository});
}
