import 'dart:async';

import 'package:dio/dio.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_driver/features/auth/domain/usecases/get_access_token.dart';
import 'package:food_driver/features/auth/domain/usecases/logout.dart';
import 'package:food_driver/features/auth/domain/usecases/refresh_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends QueuedInterceptor {
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

  Completer<bool>? _refreshCompleter;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['Authorization'] != 'No Auth') {
      await _refreshCompleter?.future;
      final authEntity = await authRepository.getAuthEntity();
      if (authEntity?.accessToken?.isNotEmpty ?? false) {
        options.headers['Authorization'] = 'Bearer ${authEntity?.accessToken}';
      }
    } else {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401 && err.response?.statusCode != 403) {
      handler.next(err);
      return;
    }

    String? authorizationHeader = switch (err.response?.requestOptions.headers["Authorization"]) {
      String bearer => bearer,
      _ => null,
    };

    if (authorizationHeader == null) {
      handler.next(err);
      return;
    }
    await _refreshCompleter?.future;

    final authEntity = await authRepository.getAuthEntity();
    if (authEntity?.accessToken?.isEmpty ?? true) {
      handler.next(err);
      return;
    } else {
      final newHeader = 'Bearer ${authEntity?.accessToken}';
      if (newHeader != authorizationHeader) {
        handler.resolve(await retryRequest(err.requestOptions));
        return;
      }
    }

    _refreshCompleter = Completer();
    final refreshResponse = await refreshAuth.call(NoParams());

    refreshResponse.fold(
      (error) {
        _refreshCompleter?.complete(false);
        handler.next(err);
      },
      (result) async {
        _refreshCompleter?.complete(true);
        if (result.isEmpty) {
          handler.next(err);
          return;
        }
        handler.resolve(await retryRequest(err.requestOptions));
      },
    );
  }

  Future<Response<dynamic>> retryRequest(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return getIt<AppHttpService>().request(
      path: requestOptions.path,
      type: RequestType.typeFromString(requestOptions.method),
      options: options,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
