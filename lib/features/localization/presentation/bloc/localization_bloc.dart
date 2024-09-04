import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/localization/domain/usecases/cache_localization.dart';
import 'package:food_driver/features/localization/domain/usecases/get_cached_localization.dart';
import 'package:food_driver/features/localization/domain/usecases/load_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'localization_bloc.freezed.dart';
part 'localization_event.dart';
part 'localization_state.dart';

@singleton
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final LoadLocalizationUseCase _loadLocales;
  final CacheLocalizationUseCase _cacheLocales;
  final GetCachedLocalizationUseCase _getCacheLocales;

  LocalizationBloc(
    this._loadLocales,
    this._cacheLocales,
    this._getCacheLocales,
  ) : super(const _Initial());

  Future<List<Locale>> getCachedLocales() async {
    var supportedLocales = [
      const Locale('en'),
      const Locale('ru'),
    ];
    var locales = await _getCacheLocales.call(NoParams());
    locales.fold(
      (l) {},
      (result) => supportedLocales = result.availableLocales,
    );
    return supportedLocales;
  }

  Future<void> loadCacheLocales() async {
    var response = await _loadLocales.call(NoParams());
    response.fold(
      (error) {},
      (result) async => await _cacheLocales.call(result),
    );
  }
}
