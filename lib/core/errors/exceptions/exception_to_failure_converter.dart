import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_driver/core/errors/exceptions/exceptions.dart';
import 'package:food_driver/core/errors/failure/failure.dart';

abstract class ExceptionToFailureConverter {
  static Failure convert(
    Object exception,
    StackTrace stackTrace,
  ) {
    log('------------------------\nEXCEPTION: $exception\n$stackTrace');
    return switch (exception) {
      UnauthorizedHttpException() => UnauthorizedServerFailure(
          message: exception.message,
        ),
      BadRequestHttpException() => BadRequestServerFailure(
          message: exception.message,
        ),
      ServerErrorHttpException() => ServerFailure(
          message: exception.message,
        ),
      NoInternetException() => const NoInternetFailure(),
      HttpMethodException() => HttpMethodFailure(
          code: exception.statusCode,
          message: exception.message,
        ),
      DioException() => _handleDioException(exception),
      (_) => const UnknownServerFailure(),
    };
  }

  static Failure _handleDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerTimeoutFailure();
      case DioExceptionType.badCertificate:
        return const ServerCertificateFailure();
      case DioExceptionType.badResponse:
        return HttpMethodFailure(
          code: dioException.response?.statusCode,
          message: dioException.response?.statusMessage,
        );
      case DioExceptionType.cancel:
        return const ServerCancelFailure();
      case DioExceptionType.connectionError:
        return const ServerConnectionFailure();
      case DioExceptionType.unknown:
        return const UnknownServerFailure();
    }
  }
}
