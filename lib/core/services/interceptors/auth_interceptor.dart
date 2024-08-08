import 'package:dio/dio.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_driver/features/auth/domain/usecases/get_access_token.dart';
import 'package:food_driver/features/auth/domain/usecases/logout.dart';
import 'package:food_driver/features/auth/domain/usecases/refresh_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor({
    required this.refreshAuth,
    required this.authRepository,
    required this.getAccessToken,
    required this.logout,
  });

  final RefreshAuthUseCase refreshAuth;
  final AuthRepository authRepository;
  final GetAccessTokenUseCase getAccessToken;
  final LogoutUseCase logout;

  int attemptCount = 0;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authEntity = await authRepository.getAuthEntity();
    if (authEntity?.accessToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer ${authEntity?.accessToken}';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print("AAA AuthInterceptor onError");
    AuthEntity? authEntity;
    final hasAccessToken =
        ((err.response?.requestOptions.headers.containsKey("Authorization") ??
                false) &&
            (err.response?.requestOptions.headers["Authorization"] is String) &&
            err.response?.requestOptions.headers["Authorization"].isNotEmpty);
    final hasUnauthorizedCode =
        err.response?.statusCode == 401 || err.response?.statusCode == 403;
    if (hasAccessToken && hasUnauthorizedCode) {
      authEntity = await authRepository.getAuthEntity();
      if (authEntity?.refreshToken?.isEmpty ?? true && attemptCount == 0) {
        attemptCount++;
        await _getAccessToken(err, handler);
        return;
      }
      if (attemptCount == 0) {
        attemptCount++;
        await _updateAuthModel(err, handler);
        return;
      } else {
        await logout.call(NoParams());
      }
    } else if (hasUnauthorizedCode && !hasAccessToken && attemptCount == 0) {
      attemptCount++;
      await _getAccessToken(err, handler);
      return;
    }
    attemptCount = 0;
    super.onError(err, handler);
  }

  Future<void> _getAccessToken(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
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
  }

  Future<void> _updateAuthModel(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
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
  }
}
