part of 'localization_bloc.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initial() = _Initial;
  const factory LocalizationState.loading() = _Loading;
  const factory LocalizationState.success() = _Success;
  const factory LocalizationState.error() = _Error;
}
