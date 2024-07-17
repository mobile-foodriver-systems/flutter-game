import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_driver/core/platform/network_info.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@LazySingleton(
  as: NetworkInfo,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  final InternetConnectionChecker internetConnectionChecker;

  const NetworkInfoImpl(
    this.internetConnectionChecker,
    this.connectivity,
  );

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}
