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
  static const String _languagePrefsKey = 'locale';

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

  @override
  Future<PhrasesDictionary?> getSupportedLocale(String locale) async {
    final response = await _localStorageService.getValue<String>(
      key: _localizationKey,
    );
    return jsonDecode(response)[locale];
  }

  @override
  Future<void> cacheLocaleLanguage(Locale locales) async {
    await _localStorageService.setValue(
      key: _languagePrefsKey,
      value: locales.languageCode,
    );
  }
}
