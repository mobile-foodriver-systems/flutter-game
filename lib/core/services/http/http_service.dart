import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:food_driver/core/errors/exceptions/exceptions.dart';
import 'package:food_driver/core/platform/network_info.dart';

enum RequestType {
  get,
  post,
  patch,
  put,
  delete;
}

abstract class HttpService {
  final Dio _dio;
  final NetworkInfo _networkInfo;

  HttpService(
    this._dio,
    this._networkInfo, {
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
          response = await _dio.get(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case RequestType.post:
          response = await _dio.post(
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
          response = await _dio.delete(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
          break;
        case RequestType.patch:
          response = await _dio.patch(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case RequestType.put:
          response = await _dio.put(
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
      if (statusCode == 500) {
        throw const ServerErrorHttpException();
      }
      throw HttpMethodException(statusCode: statusCode);
    } on FormatException catch (e) {
      throw Exception('Bad response format $e');
    } on DioException catch (e) {
      final error = e.error;
      final response = e.response;

      if (error is SocketException) {
        throw ServerErrorHttpException(message: error.message);
      }
      if (response == null) rethrow;
      final data = jsonDecode(response.toString());

      if (response.statusCode == HttpStatus.badRequest) {
        throw const BadRequestHttpException(
          message: "error",
        );
      }
      if (response.statusCode == HttpStatus.unauthorized) {
        throw UnauthorizedHttpException(
          message: data['Error'],
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
