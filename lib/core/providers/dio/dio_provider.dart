import 'package:dio/dio.dart';
import 'package:food_driver/constants/config.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioProvider {
  Dio dioProvider({
    List<InterceptorsWrapper>? interceptors,
    required String locale,
  }) {
    print("AAA S: = ${locale.toString()}");
    return Dio(
      BaseOptions(
        baseUrl: Config.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        queryParameters: {"culture": locale},
        contentType: Headers.formUrlEncodedContentType,
      ),
    )..interceptors.addAll(interceptors ?? []);
  }
}
