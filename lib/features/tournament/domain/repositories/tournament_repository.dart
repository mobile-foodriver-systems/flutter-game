import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_driver/core/errors/exceptions/exception_to_failure_converter.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/game/data/models/rating_list.dart';
import 'package:food_driver/features/tournament/data/datasources/tournament_remote_datasource.dart';
import 'package:food_driver/features/tournament/data/models/participate_error.dart';
import 'package:food_driver/features/tournament/data/models/tournament.dart';
import 'package:food_driver/features/tournament/data/models/tournament_list.dart';
import 'package:food_driver/features/user/data/models/api_error_stack.dart';
import 'package:food_driver/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

part 'package:food_driver/features/tournament/data/repositories/tournament_repository_impl.dart';

abstract class TournamentRepository {
  Future<Either<ApiErrorStack, TournamentList>> tournamentList({
    int? limit,
    int? offset,
  });

  Future<Either<Failure, List<Tournament>>> activeTournament();

  Future<Either<Failure, List<Tournament>>> completedTournament();

  Future<Either<ParticipateError, bool>> participateInTournament({
    bool? appStoreIsSandbox,
    int? gameTournamentId,
    String? appStorePurchaseReceiptData,
    String? googlePlayMarketPurchaseToken,
    String? huaweiGalleryPurchaseToken,
  });

  Future<Either<ApiErrorStack, RatingList>> tournamentRating({
    required int id,
    int? radiusInKm,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  });
}
