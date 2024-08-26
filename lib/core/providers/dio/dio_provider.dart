import 'package:dio/dio.dart';
import 'package:food_driver/constants/config.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioProvider {
  Dio dioProvider({
    List<InterceptorsWrapper>? interceptors,
    required String locale,
  }) {
    return Dio(
      BaseOptions(
        baseUrl: Config.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        queryParameters: {"culture": locale.split('_').firstOrNull},
        contentType: Headers.formUrlEncodedContentType,
      ),
    )..interceptors.addAll(interceptors ?? []);
  }
}
