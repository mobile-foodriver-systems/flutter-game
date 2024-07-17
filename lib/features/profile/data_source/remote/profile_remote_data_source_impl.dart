import 'package:food_driver/core/interceptors/auth_interceptor.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/features/profile/data_source/remote/profile_remote_data_source.dart';
import 'package:food_driver/features/profile/models/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(
  as: ProfileRemoteDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final AppHttpService _appHttpService;

  ProfileRemoteDataSourceImpl(
    this._appHttpService,
  ) {
    _appHttpService.interceptors.add(AuthInterceptor());
  }

  @override
  Future<num?> getBalance() async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.get,
    );
    return response.data.fromJson();
  }

  @override
  Future<User?> getProfile() async {
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
