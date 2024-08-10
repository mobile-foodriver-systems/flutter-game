part of 'base_location_bloc.dart';

@freezed
class BaseLocationState with _$BaseLocationState {
  const factory BaseLocationState({
    @Default(ListStatus.initial) ListStatus status,
    @Default(null) ApiList<Selectable>? apiList,
    @Default(null) Failure? error,
    @Default(null) String? searchText,
  }) = _BaseLocationState;
}
