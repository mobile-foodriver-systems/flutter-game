import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/localization/domain/repositories/localization_cache_repository.dart';
import 'package:food_driver/features/localization/domain/repositories/localization_repository.dart';

class RemoteConfigAssetLoader extends RootBundleAssetLoader {
  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {
    try {
      // Load locales from server
      final remoteData =
          await getIt<LocalizationRepository>().getSupportedLocale(
        locale.languageCode,
      );

      return remoteData.fold(
        (error) async {
          // Load cached locales
          final localData =
              await getIt<LocalizationCacheRepository>().getSupportedLocale(
            locale.languageCode,
          );
          return localData.fold(
            (_) => super.load(path, locale),
            (data) => data.toJson(),
          );
        },
        (data) => data.toJson(),
      );
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return await super.load(path, locale);
    }
  }
}
