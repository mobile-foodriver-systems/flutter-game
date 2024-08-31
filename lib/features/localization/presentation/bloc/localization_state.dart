part of 'localization_bloc.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState({
    @Default(Locale('en')) Locale selectedLanguage,
  }) = _LocalizationState;

  const factory LocalizationState.initial({
    @Default(Locale('en')) Locale selectedLanguage,
  }) = _Initial;

  const factory LocalizationState.loading({
    @Default(Locale('en')) Locale selectedLanguage,
  }) = _Loading;

  const factory LocalizationState.error({
    @Default(Locale('en')) Locale selectedLanguage,
  }) = _Error;

  const factory LocalizationState.success({
    @Default(Locale('en')) Locale selectedLanguage,
  }) = _Success;
}
