// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:food_driver/core/platform/network_info.dart';
import 'package:food_driver/core/providers/dio/dio_provider.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppHttpService extends HttpService {
  AppHttpService(
    DioProvider dioProvider,
    NetworkInfo networkInfo,
    List<InterceptorsWrapper>? interceptorList,
  ) : super(
          dioProvider.dioProvider(interceptors: interceptorList),
          networkInfo,
        );
}
