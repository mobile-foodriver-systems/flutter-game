abstract interface class LocalStorageService {
  Future<void> setValue({
    required String key,
    required Object value,
  });

  Future<T> getValue<T extends Object>({
    required String key,
  });

  Future<bool> removeValue({
    required String key,
  });

  Future<void> clear();
}
