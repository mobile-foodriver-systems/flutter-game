import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  ApiInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // options.headers['Authorization'] = 'Bearer $token';
    // handler.next(options);
  }
}
