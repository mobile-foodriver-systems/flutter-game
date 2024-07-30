import 'package:dio/dio.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/usecases/refresh_auth.dart';

class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor({
    required this.refreshAuth,
    this.authEntity,
  });

  final RefreshAuthUseCase refreshAuth;
  final AuthEntity? authEntity;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (authEntity?.accessToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer ${authEntity?.accessToken}';
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        (authEntity?.refreshToken?.isNotEmpty ?? false)) {
      final response = await refreshAuth.call(NoParams());
      response.fold(
        (error) {},
        (result) {},
      );
      //     refreshToken: authEntity!.refreshToken!);
      // final newAuthEntity = await authRepository.getAuthEntity();
      // if (newAuthEntity?.isEmpty ?? true) {
      //   return;
      // }
      // final options = Options(
      //   method: err.requestOptions.method,
      //   headers: err.requestOptions.headers,
      // );
      // print("AAA method: = ${options.method}");

      // //return handler.resolve(await dio.fetch(e.requestOptions));
      // final cloneReq = await getIt<AppHttpService>().request(
      //   path: err.requestOptions.path,
      //   type: RequestType.post,
      //   options: options,
      //   data: err.requestOptions.data,
      //   queryParameters: err.requestOptions.queryParameters,
      // );

      // return handler.resolve(cloneReq);
    }
    super.onError(err, handler);
  }
}
