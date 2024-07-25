import 'package:food_driver/core/services/local_storage/local_storage_service.dart';
import 'package:food_driver/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:food_driver/features/auth/data/models/auth_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(
  as: AuthLocalDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalStorageService _localStorageService;

  const AuthLocalDataSourceImpl(this._localStorageService);

  static const String authModelKey = "authModel";

  @override
  Future<void> deleteAuthModel() async {
    await _localStorageService.removeValue(key: authModelKey);
  }

  @override
  Future<AuthModel?> getAuthModel() async {
    return await _localStorageService.getValue(key: authModelKey);
  }

  @override
  Future<void> saveAuthModel({required AuthModel authModel}) async {
    await _localStorageService.setValue(
      key: authModelKey,
      value: authModel,
    );
  }
}
