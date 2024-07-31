import 'package:dio/dio.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_driver/features/auth/domain/usecases/get_access_token.dart';
import 'package:food_driver/features/auth/domain/usecases/refresh_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor({
    required this.refreshAuth,
    required this.authRepository,
    required this.getAccessToken,
  });

  final RefreshAuthUseCase refreshAuth;
  final AuthRepository authRepository;
  final GetAccessTokenUseCase getAccessToken;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print("AAA AuthInterceptor onRequest");
    final authEntity = await authRepository.getAuthEntity();
    print("AAA accessToken: = Bearer ${authEntity?.accessToken}");
    if (authEntity?.accessToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer ${authEntity?.accessToken}';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print("AAA AuthInterceptor onError");
    final authEntity = await authRepository.getAuthEntity();
    if (err.response?.statusCode == 401 &&
        (authEntity?.refreshToken?.isEmpty ?? true) &&
        (authEntity?.accessToken?.isNotEmpty ?? false)) {
      print("AAA ApiInterceptor IF");
      final response = await getAccessToken(NoParams());
      response.fold(
        (error) => handler.next(err),
        (result) async {
          if (result.accessToken?.isEmpty ?? true) {
            handler.next(err);
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
          handler.resolve(cloneReq);
        },
      );
      return;
    } else if (err.response?.statusCode == 401 &&
        (authEntity?.refreshToken?.isNotEmpty ?? false)) {
      print("AAA AuthInterceptor IF");
      final response = await refreshAuth.call(NoParams());
      response.fold(
        (error) => handler.next(err),
        (result) async {
          if (result.isEmpty) {
            handler.next(err);
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
          handler.resolve(cloneReq);
        },
      );
      return;
    }
    print("AAA AuthInterceptor ELSE");
    return handler.next(err);
  }
}
