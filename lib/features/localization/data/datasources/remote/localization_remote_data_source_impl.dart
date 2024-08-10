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

  LocalizationRemoteDataSourceImpl(
    this._appHttpService,
  );

  @override
  Future<SupportedLocales> getSupportedLocales() async {
    final response = await _appHttpService.request(
      path: ApiRoutes.localization,
      type: RequestType.get,
    );
    return SupportedLocales.fromJson(response.data);
  }
}
