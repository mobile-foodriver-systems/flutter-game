part of 'city_bloc.dart';


@freezed
class CityState with _$CityState {
  const factory CityState({
    @Default(ListStatus.initial) ListStatus status,
  })  = _CityState;
}
