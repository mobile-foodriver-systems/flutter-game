part of 'city_bloc.dart';

@freezed
class CityState with _$CityState {
  const factory CityState({
    @Default(ListStatus.initial) ListStatus status,
    @Default(null) CityList? cityList,
    @Default(null) Failure? error,
    @Default(null) String? searchText,
  }) = _CityState;
}
