import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_driver/core/services/local_storage/local_storage_service.dart';
import 'package:food_driver/features/localization/data/models/phrases_dictionary.dart';
import 'package:food_driver/features/localization/data/models/supported_locales.dart';
import 'package:injectable/injectable.dart';

part 'localization_local_data_source_impl.dart';

abstract interface class LocalizationLocalDataSource {
  Future<SupportedLocales?> getSupportedLocales();

  Future<PhrasesDictionary?> getSupportedLocale(String locale);

  Future<void> cacheLocales(SupportedLocales locales);

  Future<void> cacheLocaleLanguage(Locale locales);
}
