// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_driver/core/platform/network_info.dart';
import 'package:food_driver/core/providers/dio/dio_provider.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod])
class AppHttpService extends HttpService {
  // final AuthInterceptor authInterceptor;
  AppHttpService(
    DioProvider dioProvider,
    NetworkInfo networkInfo,
    String locale,
    // this.authInterceptor,
  ) : super(
          dioProvider.dioProvider(
            interceptors: [],
            locale: locale,
          ),
          networkInfo,
          locale,
        );
}
