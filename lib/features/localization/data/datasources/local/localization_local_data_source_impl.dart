part of "localization_local_data_source.dart";

@LazySingleton(
  as: LocalizationLocalDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class LocalizationLocalDataSourceImpl implements LocalizationLocalDataSource {
  static const String _localizationKey = 'localizationKey';

  final LocalStorageService _localStorageService;

  LocalizationLocalDataSourceImpl(
    this._localStorageService,
  );

  @override
  Future<SupportedLocales> getSupportedLocales() async {
    final response = await _localStorageService.getValue<String>(
      key: _localizationKey,
    );

    return SupportedLocales.fromJson(jsonDecode(response));
  }

  @override
  Future<void> cacheLocales(SupportedLocales locales) async {
    await _localStorageService.setValue(
      key: _localizationKey,
      value: jsonEncode(locales),
    );
  }
}
