import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/location/data/models/country_list.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:food_driver/features/location/presentation/bloc/base_location_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'country_bloc.freezed.dart';
part 'country_event.dart';
part 'country_state.dart';

@injectable
class CountryBloc extends BaseLocationBloc {
  // final LoadCountryUseCase _loadCountryUseCase;

  CountryBloc(super._loadCountryUseCase, super._loadCityUseCase
      // this._loadCountryUseCase,
      // super._loadSelectableUseCase,
      ) {
    // on<CountryLoadEvent>(_loadCountry);
  }

  // void _loadCountry(
  //   CountryLoadEvent event,
  //   Emitter<CountryState> emit,
  // ) async {
  //   if (state.countryList == null || event.searchText != state.searchText) {
  //     emit(state.copyWith(
  //       status: ListStatus.initial,
  //       error: null,
  //       searchText: event.searchText,
  //       countryList: null,
  //     ));
  //   }
  //   if (state.countryList != null &&
  //           (state.countryList?.list.length ?? 0) >=
  //               (state.countryList?.count ?? 0) ||
  //       state.status == ListStatus.loading) {
  //     return;
  //   }
  //   if (state.countryList != null) {
  //     emit(state.copyWith(status: ListStatus.loading));
  //   }
  //   final params = state.countryList == null
  //       ? CountryParams(searchText: event.searchText)
  //       : CountryParams(
  //           offset: (state.countryList!.count ?? 0) <
  //                   ((state.countryList!.offset ?? 0) +
  //                       state.countryList!.limit)
  //               ? state.countryList!.offset ?? 0
  //               : (state.countryList!.offset ?? 0) + state.countryList!.limit,
  //           searchText: event.searchText,
  //         );
  //   final response = await _loadCountryUseCase(params);
  //   response.fold(
  //     (error) {
  //       emit(state.copyWith(status: ListStatus.error, error: error));
  //     },
  //     (result) {
  //       emit(state.copyWith(
  //         status: ListStatus.success,
  //         countryList: CountryList.update(
  //           countryList: state.countryList ??
  //               CountryList(
  //                 count: result.count,
  //                 limit: result.limit,
  //                 offset: 0,
  //                 list: [],
  //               ),
  //           list: result.list,
  //           offset: params.offset ?? 0,
  //         ),
  //       ));
  //     },
  //   );
  // }
}
