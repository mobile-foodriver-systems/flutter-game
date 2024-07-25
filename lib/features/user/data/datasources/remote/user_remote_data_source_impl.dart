import 'package:food_driver/core/interceptors/auth_interceptor.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:food_driver/features/user/data/models/models/user.dart';
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

  UserRemoteDataSourceImpl(
    this._appHttpService,
  ) {
    _appHttpService.interceptors.add(AuthInterceptor());
  }

  @override
  Future<num?> balance() async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
    );
    return response.data.fromJson();
  }

  @override
  Future<User?> profile() async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
    );
    return response.data.fromJson();
  }

  @override
  Future<bool> deleteAccount() async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> logout() async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
    );
    return response.statusCode == 200;
  }
}
