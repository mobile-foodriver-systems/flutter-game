part of 'tournament_remote_datasource.dart';

@LazySingleton(
  as: TournamentRemoteDatasource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class TournamentRemoteDatasourceImpl implements TournamentRemoteDatasource {
  final AppHttpService _appHttpService;
  final LocaleService _localeService;
  TournamentRemoteDatasourceImpl(
    this._appHttpService,
    this._localeService,
  );
  @override
  Future<List<Tournament>> activeTournament() async {
    final response = await _appHttpService.request(
      path: ApiRoutes.activeTournament,
      type: RequestType.get,
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
    if (response.data == null) return [];
    return (response.data as List).map((t) => Tournament.fromJson(t)).toList();
  }

  @override
  Future<List<Tournament>> completedTournament() async {
    final response = await _appHttpService.request(
      path: ApiRoutes.completedTournament,
      type: RequestType.get,
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
    if (response.data == null) return [];
    return (response.data as List).map((t) => Tournament.fromJson(t)).toList();
  }

  @override
  Future<Response<dynamic>> participateInTournament({
    bool? appStoreIsSandbox,
    int? gameTournamentId,
    String? appStorePurchaseReceiptData,
    String? googlePlayMarketPurchaseToken,
    String? huaweiGalleryPurchaseToken,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.participateInTournament,
      type: RequestType.post,
      data: {
        if (appStoreIsSandbox != null) "appStoreIsSandbox": appStoreIsSandbox,
        if (gameTournamentId != null) "gameTournamentId": gameTournamentId,
        if (appStorePurchaseReceiptData != null)
          "appStorePurchaseReceiptData": appStorePurchaseReceiptData,
        if (googlePlayMarketPurchaseToken != null)
          "googlePlayMarketPurchaseToken": googlePlayMarketPurchaseToken,
        if (huaweiGalleryPurchaseToken != null)
          "huaweiGalleryPurchaseToken": huaweiGalleryPurchaseToken,
      },
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }

  @override
  Future<Response<dynamic>> tournamentList({
    int? limit,
    int? offset,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.tournamentList,
      type: RequestType.get,
      queryParameters: {
        if (limit != null) "limit": limit,
        if (offset != null) "offset": offset,
        "culture": _localeService.languageCode,
      },
    );
  }

  @override
  Future<Response> tournamentRating({
    required int id,
    int? radiusInKm,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.tournamentRating(id.toString()),
      type: RequestType.get,
      queryParameters: {
        if (radiusInKm != null) "radiusInKm": radiusInKm,
        if (latitude != null) "latitude": latitude,
        if (longitude != null) "longitude": longitude,
        if (limit != null) "limit": limit,
        if (offset != null) "offset": offset,
        "culture": _localeService.languageCode,
      },
    );
  }
}
