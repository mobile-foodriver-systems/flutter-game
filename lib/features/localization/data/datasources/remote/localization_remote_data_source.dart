import 'package:food_driver/constants/api_routes.dart';
import 'package:food_driver/core/services/http/app_http_service.dart';
import 'package:food_driver/core/services/http/http_service.dart';
import 'package:food_driver/core/services/locale_service/locale_service.dart';
import 'package:food_driver/features/localization/data/models/supported_locales.dart';
import 'package:injectable/injectable.dart';

part 'localization_remote_data_source_impl.dart';

abstract interface class LocalizationRemoteDataSource {
  Future<SupportedLocales> getSupportedLocales();
}
