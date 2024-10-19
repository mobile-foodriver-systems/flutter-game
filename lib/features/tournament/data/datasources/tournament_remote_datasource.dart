import 'package:dio/dio.dart';
import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/services/locale_service/locale_service.dart';
import 'package:food_driver/features/tournament/data/models/tournament.dart';
import 'package:injectable/injectable.dart';

part 'tournament_remote_datasource_impl.dart';

abstract interface class TournamentRemoteDatasource {
  Future<Response<dynamic>> tournamentList({
    int? limit,
    int? offset,
  });

  Future<List<Tournament>> activeTournament();

  Future<List<Tournament>> completedTournament();

  Future<Response<dynamic>> participateInTournament({
    bool? appStoreIsSandbox,
    int? gameTournamentId,
    String? appStorePurchaseReceiptData,
    String? googlePlayMarketPurchaseToken,
    String? huaweiGalleryPurchaseToken,
  });

  Future<Response<dynamic>> tournamentRating({
    required int id,
    int? radiusInKm,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  });
}
