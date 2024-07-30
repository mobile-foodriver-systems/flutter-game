import 'package:dio/dio.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_driver/features/auth/domain/usecases/get_access_token.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiInterceptor extends InterceptorsWrapper {
  ApiInterceptor({
    required this.getAccessToken,
    required this.authRepository,
  });

  final GetAccessTokenUseCase getAccessToken;
  final AuthRepository authRepository;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authEntity = await authRepository.getAuthEntity();
    if (authEntity?.accessToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer ${authEntity!.accessToken}';
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print("AAA ApiInterceptor onError");
    final authEntity = await authRepository.getAuthEntity();
    if (err.response?.statusCode == 401 &&
        (authEntity?.refreshToken?.isEmpty ?? true) &&
        (authEntity?.accessToken?.isNotEmpty ?? false)) {
      final response = await getAccessToken(NoParams());
      response.fold(
        (error) => super.onError(err, handler),
        (result) async {
          if (result.accessToken?.isEmpty ?? true) {
            super.onError(err, handler);
            return;
          }
          final options = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          );
          final cloneReq = await getIt<AppHttpService>().request(
            path: err.requestOptions.path,
            type: RequestType.typeFromString(err.requestOptions.method),
            options: options,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(cloneReq);
        },
      );
    }
  }
}
