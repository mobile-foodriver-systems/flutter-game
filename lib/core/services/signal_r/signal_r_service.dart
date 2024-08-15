import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/constants/config.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_driver/features/game/data/models/drive_route.dart';
import 'package:food_driver/features/game/data/models/route_list.dart';
import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/signalr_client.dart';

part 'package:food_driver/core/services/signal_r/signal_r_event.dart';
part 'package:food_driver/core/services/signal_r/app_signal_r_service.dart';

abstract class SignalRService {
  const SignalRService({
    required AuthRepository authRepository,
  }) : _persisting = authRepository;

  final AuthRepository _persisting;

  Future<void> disconnect();

  Future<void> connect();

  Future<Object?> invoke({
    required String methodName,
    List<Object>? args,
  });
}
