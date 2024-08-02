part of 'country_bloc.dart';

@freezed
class CountryState with _$CountryState {
  const factory CountryState({
    @Default(ListStatus.initial) ListStatus status,
  })  = _CountryState;
}
