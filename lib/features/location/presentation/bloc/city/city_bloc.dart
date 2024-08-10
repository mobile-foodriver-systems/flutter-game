import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/location/data/models/city_list.dart';
import 'package:food_driver/features/location/data/models/city_params.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:food_driver/features/location/domain/usecases/load_city.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'city_bloc.freezed.dart';
part 'city_event.dart';
part 'city_state.dart';

@injectable
class CityBloc extends Bloc<CityEvent, CityState> {
  final LoadCityUseCase _loadCityUseCase;
  CityBloc(this._loadCityUseCase) : super(const CityState()) {
    on<CityLoadEvent>(_loadCity);
  }

  void _loadCity(
    CityLoadEvent event,
    Emitter<CityState> emit,
  ) async {
    if (state.cityList == null || event.searchText != state.searchText) {
      emit(state.copyWith(
        status: ListStatus.initial,
        error: null,
        searchText: event.searchText,
        cityList: null,
      ));
    }
    if (state.cityList != null &&
            (state.cityList?.list.length ?? 0) >=
                (state.cityList?.count ?? 0) ||
        state.status == ListStatus.loading) {
      return;
    }
    if (state.cityList != null) {
      emit(state.copyWith(status: ListStatus.loading));
    }
    final params = state.cityList == null
        ? CityParams(
            countryId: event.countryId,
            searchText: event.searchText,
          )
        : CityParams(
            countryId: event.countryId,
            offset: (state.cityList!.count ?? 0) <
                    ((state.cityList!.offset ?? 0) + state.cityList!.limit)
                ? state.cityList!.offset ?? 0
                : (state.cityList!.offset ?? 0) + state.cityList!.limit,
            searchText: event.searchText,
          );
    final response = await _loadCityUseCase(params);
    response.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) {
        emit(state.copyWith(
          status: ListStatus.success,
          cityList: CityList.update(
            cityList: state.cityList ??
                CityList(
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
}
