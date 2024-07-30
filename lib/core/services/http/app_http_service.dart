// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_driver/core/platform/network_info.dart';
import 'package:food_driver/core/providers/dio/dio_provider.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/features/auth/domain/usecases/get_access_token.dart';
import 'package:food_driver/features/auth/domain/usecases/refresh_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.dev, Environment.prod])
class AppHttpService extends HttpService {
  // final AuthInterceptor authInterceptor;
  AppHttpService(
    DioProvider dioProvider,
    NetworkInfo networkInfo,
    String locale,
    GetAccessTokenUseCase getAccessToken,
    RefreshAuthUseCase refreshAuth,
    // this.authInterceptor,
  ) : super(
          dioProvider.dioProvider(
            interceptors: [
              // ApiInterceptor(getAccessToken: getAccessToken, authEntity: null),
              // AuthInterceptor(refreshAuth: refreshAuth, authEntity: null),
            ],
            locale: locale,
          ),
          networkInfo,
          locale,
          getAccessToken,
          refreshAuth,
        );
}
