import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/location/data/models/api_list.dart';
import 'package:food_driver/features/location/data/models/country_params.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/location/domain/usecases/load_city.dart';
import 'package:food_driver/features/location/domain/usecases/load_country.dart';
import 'package:food_driver/features/location/presentation/bloc/city/city_bloc.dart';
import 'package:food_driver/features/location/presentation/bloc/country/country_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'base_location_bloc.freezed.dart';
part 'base_location_state.dart';
part 'location_event.dart';

abstract class BaseLocationBloc extends Bloc<LocationEvent, BaseLocationState> {
  final LoadCountryUseCase? _loadCountryUseCase;
  final LoadCityUseCase? _loadCityUseCase;

  BaseLocationBloc(
    this._loadCountryUseCase,
    this._loadCityUseCase,
  ) : super(const BaseLocationState()) {
    on<CountryLoadEvent>(_loadCountry);
    on<CityLoadEvent>(_loadCity);
  }

  void _loadCountry(
    LoadEvent event,
    Emitter<BaseLocationState> emit,
  ) async {
    if (state.apiList == null || event.searchText != state.searchText) {
      emit(state.copyWith(
        status: ListStatus.initial,
        error: null,
        searchText: event.searchText,
        apiList: null,
      ));
    }
    if (state.apiList != null &&
            (state.apiList?.list.length ?? 0) >= (state.apiList?.count ?? 0) ||
        state.status == ListStatus.loading) {
      return;
    }
    if (state.apiList != null) {
      emit(state.copyWith(status: ListStatus.loading));
    }
    final params = state.apiList == null
        ? CountryParams(searchText: event.searchText)
        : CountryParams(
            offset: (state.apiList!.count ?? 0) <
                    ((state.apiList!.offset ?? 0) + state.apiList!.limit)
                ? state.apiList!.offset ?? 0
                : (state.apiList!.offset ?? 0) + state.apiList!.limit,
            searchText: event.searchText,
          );
    final response = await _loadCountryUseCase?.call(params);
    response?.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) {
        emit(state.copyWith(
          status: ListStatus.success,
          apiList: ApiList.update(
            apiList: state.apiList ??
                ApiList(
                  count: result.count,
                  limit: result.limit,
                  offset: 0,
                  list: [],
                ),
            list: result.list,
            offset: params.offset ?? 0,
          ),
        ));
      },
    );
  }

  void _loadCity(
    CityLoadEvent event,
    Emitter<CityState> emit,
  ) {}
}
