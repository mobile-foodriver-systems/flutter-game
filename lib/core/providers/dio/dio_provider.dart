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
        connectTimeout: const Duration(seconds: 5),
        queryParameters: {"culture": locale.split('_').firstOrNull},
        // validateStatus: (status) =>
        //     status! < 500 && status != 401 && status != 403,
        contentType: Headers.formUrlEncodedContentType,
      ),
    )..interceptors.addAll(interceptors ?? []);
  }
}
