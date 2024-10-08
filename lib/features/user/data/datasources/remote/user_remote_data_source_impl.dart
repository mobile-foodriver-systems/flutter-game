import 'package:dio/dio.dart';
import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/services/locale_service/locale_service.dart';
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:food_driver/features/user/data/models/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(
  as: UserRemoteDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final AppHttpService _appHttpService;
  final LocaleService _localeService;

  UserRemoteDataSourceImpl(
    this._appHttpService,
    this._localeService,
  );

  @override
  Future<User> profile() async {
    final response = await _appHttpService.request(
      path: ApiRoutes.profile,
      type: RequestType.get,
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
    print(
        "AAA type: = ${response.data.runtimeType}, data: = ${response.data}, response.statusCode: = ${response.statusCode}, response.statusMessage: = ${response.statusMessage}");
    return User.fromJson(response.data);
  }

  @override
  Future<bool> deleteAccount() async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> logout() async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
    return response.statusCode == 200;
  }

  @override
  Future<Response<dynamic>> update({
    int? cityId,
    String? email,
    String? walletAddress,
    String? userName,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.account,
      type: RequestType.put,
      options: Options(contentType: 'application/json-patch+json'),
      data: {
        if (cityId != null) "cityId": cityId,
        if (email?.isNotEmpty ?? false) "email": email,
        if (walletAddress?.isNotEmpty ?? false) "walletAddress": walletAddress,
        if (userName?.isNotEmpty ?? false) "userName": userName,
      },
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }

  @override
  Future<Response> updateLatLng({
    required double latitude,
    required double longitude,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.updateLocation,
      type: RequestType.put,
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: {
        "latitude": latitude,
        "longitude": longitude,
      },
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }

  @override
  Future<Response<dynamic>> getConfirmationCode({required String email}) async {
    return await _appHttpService.request(
      path: ApiRoutes.getConfirmationCode,
      type: RequestType.post,
      options: Options(
        contentType: 'application/json-patch+json',
      ),
      data: {"email": email},
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }

  @override
  Future<Response<dynamic>> sendConfirmationCode({required String code}) async {
    return await _appHttpService.request(
      path: ApiRoutes.sendConfirmationCode,
      type: RequestType.post,
      options: Options(
        contentType: 'application/json-patch+json',
      ),
      data: {"code": code},
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }

  @override
  Future<Response<dynamic>> recoveryPassword({
    required String email,
    required String password,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.recoveryPassword,
      type: RequestType.post,
      options: Options(
        contentType: 'application/json-patch+json',
      ),
      data: {
        "email": email,
        "newPassword": password,
      },
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }

  @override
  Future<Response<dynamic>> confirmPasswordRecovery({
    required String email,
    required String code,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.confirmPasswordRecovery,
      type: RequestType.post,
      options: Options(
        contentType: 'application/json-patch+json',
      ),
      data: {
        "email": email,
        "code": code,
      },
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }
}
