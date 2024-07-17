import 'package:food_driver/core/errors/exceptions/exceptions.dart';
import 'package:food_driver/core/services/local_storage/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: LocalStorageService)
class LocalStorageServiceImpl implements LocalStorageService {
  final SharedPreferences _prefs;

  const LocalStorageServiceImpl(
    this._prefs,
  );

  @override
  Future<T> getValue<T extends Object>({
    required String key,
  }) async {
    final value = _prefs.get(key);
    if (value == null) {
      throw const ObjectNotFoundException();
    }
    if (value is! T) {
      throw const ObjectCastException();
    }
    return value;
  }

  @override
  Future<void> setValue({
    required String key,
    required Object value,
  }) async {
    if (value is String) {
      await _prefs.setString(key, value);
      return;
    }
    if (value is int) {
      await _prefs.setInt(key, value);
      return;
    }
    if (value is bool) {
      await _prefs.setBool(key, value);
      return;
    }
    if (value is double) {
      await _prefs.setDouble(key, value);
      return;
    }
    if (value is List<String>) {
      await _prefs.setStringList(key, value);
      return;
    }
    throw const ObjectCastException();
  }

  @override
  Future<bool> removeValue({
    required String key,
  }) async {
    final value = await _prefs.remove(key);
    return value;
  }

  @override
  Future<void> clear() async => _prefs.clear();
}
