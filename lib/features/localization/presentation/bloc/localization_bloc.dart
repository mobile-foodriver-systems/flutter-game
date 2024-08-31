import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/localization/domain/usecases/cache_localization.dart';
import 'package:food_driver/features/localization/domain/usecases/change_language.dart';
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
  final ChangeLanguageUseCase _changeLanguage;

  LocalizationBloc(
    this._loadLocales,
    this._cacheLocales,
    this._getCacheLocales,
    this._changeLanguage,
  ) : super(const _Initial()) {
    on<LocalizationEvent>(_loadSupportedLocales);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  void _loadSupportedLocales(
    LocalizationEvent event,
    Emitter<LocalizationState> emit,
  ) async {
    emit(const _Loading());
    var response = await _loadLocales.call(NoParams());
    response.fold(
      (error) => emit(const _Error()),
      (result) => _cacheLocales.call(result),
    );
    emit(const _Success());
  }

  void _onChangeLanguage(
    ChangeLanguage event,
    Emitter<LocalizationState> emit,
  ) async {
    await _changeLanguage.call(event.selectedLanguage);
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  Future<List<Locale>> getSupportedLocales() async {
    var supportedLocales = [
      const Locale('en'),
      const Locale('ru'),
    ];

    var response = await _loadLocales.call(NoParams());
    response.fold(
      (error) async {
        var locales = await _getCacheLocales.call(NoParams());
        locales.fold(
          (l) {},
          (result) => supportedLocales = result.availableLocales,
        );
      },
      (result) => supportedLocales = result.availableLocales,
    );
    return supportedLocales;
  }
}
