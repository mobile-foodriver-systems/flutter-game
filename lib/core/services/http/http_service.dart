import 'dart:io';

import 'package:dio/dio.dart';
import 'package:food_driver/core/errors/exceptions/exceptions.dart';
import 'package:food_driver/core/platform/network_info.dart';
import 'package:food_driver/core/services/interceptors/auth_interceptor.dart';
import 'package:food_driver/di/injection.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

enum RequestType {
  get,
  post,
  patch,
  put,
  delete;

  static RequestType typeFromString(String value) {
    if (value == 'GET') {
      return RequestType.get;
    }
    if (value == 'POST') {
      return RequestType.post;
    }
    if (value == 'DELETE') {
      return RequestType.delete;
    }
    if (value == 'PUT') {
      return RequestType.put;
    }
    if (value == 'PATCH') {
      return RequestType.patch;
    }
    return RequestType.get;
  }
}

abstract class HttpService {
  final Dio _dio;
  late Dio dio = _initDio();
  final NetworkInfo _networkInfo;
  final String _locale;

  Dio _initDio() => _dio
    ..interceptors.addAll([
      getIt<AuthInterceptor>(),
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseMessage: true,
        ),
      ),
    ]);

  HttpService(
    this._dio,
    this._networkInfo,
    this._locale, {
    List<InterceptorsWrapper>? interceptorList,
  }) {
    interceptorList?.forEach((e) => interceptors.add(e));
  }

  Interceptors get interceptors => _dio.interceptors;

  Future<Response> request({
    required String path,
    required RequestType type,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    late final Response response;

    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) throw const NoInternetException();

    try {
      switch (type) {
        case RequestType.get:
          response = await dio.get(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case RequestType.post:
          response = await dio.post(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case RequestType.delete:
          response = await dio.delete(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
          break;
        case RequestType.patch:
          response = await dio.patch(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case RequestType.put:
          response = await dio.put(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
      }

      final int? statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        return response;
      }
      if (statusCode == 401) {
        throw UnauthorizedHttpException(
          message: response.statusMessage,
        );
      }

      if ((statusCode ?? 0) >= 400 &&
          (response.data != null ||
              ((response.data is String) && (response.data.isNotEmpty)))) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      throw HttpMethodException(statusCode: statusCode);
    } on FormatException catch (e) {
      throw Exception('Bad response format $e');
    } on DioException catch (e) {
      final error = e.error;
      final response = e.response;
      if (response?.data != null ||
          ((response?.data is String) && (response!.data.isNotEmpty))) {
        return response!;
      }
      if (error is SocketException) {
        throw ServerErrorHttpException(message: error.message);
      }
      if (response == null) rethrow;
      if (response.statusCode == HttpStatus.badRequest) {
        throw const BadRequestHttpException(
          message: "error",
        );
      }
      if (response.statusCode == HttpStatus.unauthorized) {
        throw const UnauthorizedHttpException(
          message: "error",
        );
      }
      if (response.statusCode == HttpStatus.networkConnectTimeoutError) {
        throw const NetworkConnectTimeoutException();
      }

      rethrow;
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
