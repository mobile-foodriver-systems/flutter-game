import 'package:dio/dio.dart';
import 'package:food_driver/constants/environment_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioProvider {
  DioProvider();

  Dio dioProvider({List<InterceptorsWrapper>? interceptors}) {
    return Dio(
      BaseOptions(
        baseUrl: EnvironmentConstants().baseUrl,
        connectTimeout: const Duration(seconds: 10),
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (status) => status != 401 && status != 403,
      ),
    )..interceptors.addAll(interceptors ?? []);
  }
}
