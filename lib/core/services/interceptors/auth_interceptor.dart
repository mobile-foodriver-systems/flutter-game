import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
    if (options.headers['UnAuthorizedRequest'] == null) {
      await _refreshCompleter?.future;
      final authEntity = await authRepository.getAuthEntity();
      if (authEntity?.accessToken?.isNotEmpty ?? false) {
        options.headers[HttpHeaders.authorizationHeader] =
            'Bearer ${authEntity?.accessToken}';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401 && err.response?.statusCode != 403) {
      return handler.next(err);
    }

    String? authorizationHeader = switch (
        err.response?.requestOptions.headers[HttpHeaders.authorizationHeader]) {
      String bearer => bearer,
      _ => null,
    };

    if (authorizationHeader == null) {
      await authRepository.initAuthEntity();
      return handler.resolve(await retryRequest(err.requestOptions));
    }
    await _refreshCompleter?.future;

    final authEntity = await authRepository.getAuthEntity();
    if (authEntity?.accessToken?.isEmpty ?? true) {
      return handler.next(err);
    } else {
      final newHeader = 'Bearer ${authEntity?.accessToken}';
      if (newHeader != authorizationHeader) {
        return handler.resolve(await retryRequest(err.requestOptions));
      }
    }

    _refreshCompleter = Completer();
    final refreshResponse = await refreshAuth.call(NoParams());

    refreshResponse.fold(
      (error) {
        _refreshCompleter?.complete(false);
        return handler.next(err);
      },
      (result) async {
        _refreshCompleter?.complete(true);
        if (result.isEmpty) {
          return handler.next(err);
        }
        return handler.resolve(await retryRequest(err.requestOptions));
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

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) printRequestInfo(response: response);
    super.onResponse(response, handler);
  }

  void printRequestInfo({required Response response}) {
    final headers = response.requestOptions.headers.isNotEmpty
        ? "\nHEADERS:\n${response.requestOptions.headers.toString()}"
        : "";
    final params = response.requestOptions.queryParameters.isNotEmpty
        ? "\nQueryParameters:\n${response.requestOptions.queryParameters.toString()}"
        : "";
    final body = response.requestOptions.data == null
        ? ""
        : "\nBODY:\n${response.requestOptions.data.toString()}";

    log('REQUEST\nmethod: ${response.requestOptions.method}, url: ${response.requestOptions.baseUrl}${response.requestOptions.path}, code: ${response.statusCode}, statusMessage: ${response.statusMessage}$headers$params$body\nRESPONSE\n${response.data.toString()}');
  }
}
