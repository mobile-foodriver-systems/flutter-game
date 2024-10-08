part of "localization_remote_data_source.dart";

@LazySingleton(
  as: LocalizationRemoteDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class LocalizationRemoteDataSourceImpl implements LocalizationRemoteDataSource {
  final AppHttpService _appHttpService;
  final LocaleService _localeService;

  LocalizationRemoteDataSourceImpl(
    this._appHttpService,
    this._localeService,
  );

  @override
  Future<SupportedLocales> getSupportedLocales() async {
    final response = await _appHttpService.request(
      path: ApiRoutes.localization,
      type: RequestType.get,
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
    return SupportedLocales.fromJson(response.data);
  }
}
