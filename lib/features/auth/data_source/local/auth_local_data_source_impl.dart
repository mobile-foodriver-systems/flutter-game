import 'package:food_driver/core/services/local_storage/local_storage_service.dart';
import 'package:food_driver/features/auth/data_source/local/auth_local_data_source.dart';
import 'package:food_driver/features/auth/models/auth_model.dart';
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

  static const String tokenModelKey = "authModel";

  @override
  Future<void> deleteTokenModel() async {
    await _localStorageService.removeValue(key: tokenModelKey);
  }

  @override
  Future<AuthModel?> getTokenModel() async {
    return await _localStorageService.getValue(key: tokenModelKey);
  }

  @override
  Future<void> saveTokenModel({required AuthModel authModel}) async {
    await _localStorageService.setValue(
      key: tokenModelKey,
      value: authModel,
    );
  }
}
