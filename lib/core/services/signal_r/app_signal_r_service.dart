part of 'package:food_driver/core/services/signal_r/signal_r_service.dart';

@LazySingleton(env: [Environment.dev, Environment.prod])
class AppSignalRService extends SignalRService {
  AppSignalRService({
    required super.authRepository,
  });

  static HubConnection? hubConnection;

  static final StreamController<SignalREvent> _streamController =
      StreamController<SignalREvent>.broadcast();

  Stream<SignalREvent> get onEventSignalR => _streamController.stream;

  StreamSink<SignalREvent> get sinkSignalR => _streamController.sink;

  static Timer? connectionTimer;

  @override
  Future<void> disconnect() async {
    _cancelReconnect();
    await hubConnection?.stop();
    hubConnection = null;
  }

  @override
  Future<void> connect() async {
    await disconnect();

    final accessToken = (await _persisting.getAuthEntity())?.accessToken;
    if (accessToken == null) return;

    final uri = Uri.parse(EnvironmentConstants().baseUrl);

    final formattedServerUrl = uri.replace(
      path: ApiRoutes.signalR,
      queryParameters: {'access_token': accessToken},
    ).toString();

    final builder = HubConnectionBuilder();

    hubConnection =
        builder.withAutomaticReconnect().withUrl(formattedServerUrl).build();

    hubConnection?.onreconnected(({String? connectionId}) async {
      if (kDebugMode) log('onreconnected $connectionId');
      _cancelReconnect();
    });
    hubConnection?.onreconnecting(({Exception? error}) {
      if (kDebugMode) log('onreconnecting...');
    });
    hubConnection?.onclose(({Exception? error}) {
      if (kDebugMode) log('hubConnection $error');
      connectionTimer?.cancel();
      connectionTimer = Timer(const Duration(seconds: 1), () async {
        hubConnection = null;
        await connect();
      });
    });
    hubConnection?.on('RouteListChanged', _onReceived);
    hubConnection?.on('RouteCompletedSuccess', _onReceived);
    hubConnection?.on(
      'RouteCompletedFailed',
      (_) => _streamController.sink.add(const RouteCompletedFailedEvent()),
    );

    try {
      await hubConnection?.start();

      if (kDebugMode) {
        log('hubConnection success');
      }
    } on Object catch (e) {
      if (kDebugMode) {
        log('${e.runtimeType}: ${e.toString()}');
        log('reconnect to:');
        log(hubConnection?.baseUrl ?? '');
      }
      connectionTimer?.cancel();
      connectionTimer = Timer(const Duration(seconds: 1), () async {
        hubConnection = null;
        connect();
      });
    }
  }

  @override
  Future<Object?> invoke({
    required String methodName,
    List<Object>? args,
  }) async {
    if (hubConnection == null) {
      await connect();
    }
    return await hubConnection?.invoke(
      methodName,
      args: args,
    );
  }

  void _onReceived(List<Object?>? arguments) {
    if (arguments?.isEmpty ?? true) {
      if (kDebugMode) log('arguments.isEmpty');
      return;
    }

    final rawData = arguments?.first;
    if (rawData is! Map) {
      if (kDebugMode) log('arguments[0] is! Map\n$rawData');
      return;
    }

    final data = rawData;

    try {
      // if (kDebugMode) log("SIGNAL R DATA: $data");
      if (data.containsKey('routeList')) {
        final routes = RouteList.fromJson(data as Map<String, dynamic>);
        _streamController.sink.add(AddRoutesEvent(routes: routes.routeList));
        return;
      } else if (data.containsKey('rewardInFDT')) {
        _streamController.sink.add(RewardEvent(
            reward:
                (data as Map<String, dynamic>)['rewardInFDT'] as num? ?? 0));
      }
    } on Object catch (e) {
      debugPrint(
        'Ошибка модели MessageModel\n'
        'error: $e\n'
        'data: $data',
      );
    }
  }

  void _cancelReconnect() {
    connectionTimer?.cancel();
    connectionTimer = null;
  }
}
