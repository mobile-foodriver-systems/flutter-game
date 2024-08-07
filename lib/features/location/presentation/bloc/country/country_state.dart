part of 'country_bloc.dart';

@freezed
class CountryState with _$CountryState {
  const factory CountryState({
    @Default(ListStatus.initial) ListStatus status,
    @Default(null) CountryList? countryList,
    @Default(null) Failure? error,
  }) = _CountryState;
}
