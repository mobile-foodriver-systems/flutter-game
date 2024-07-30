import 'package:dio/dio.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:food_driver/features/auth/domain/usecases/get_access_token.dart';

class ApiInterceptor extends InterceptorsWrapper {
  ApiInterceptor({
    required this.getAccessToken,
    this.authEntity,
  });

  final GetAccessTokenUseCase getAccessToken;
  final AuthEntity? authEntity;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (authEntity?.accessToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer ${authEntity!.accessToken}';
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        (authEntity?.refreshToken?.isEmpty ?? true) &&
        (authEntity?.accessToken?.isNotEmpty ?? false)) {
      final response = await getAccessToken(NoParams());
      response.fold(
        (error) {},
        (result) {},
      );
    }
  }
}
