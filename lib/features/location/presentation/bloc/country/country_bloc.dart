import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/location/data/models/country_list.dart';
import 'package:food_driver/features/location/data/models/country_params.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:food_driver/features/location/domain/usecases/load_country.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'country_bloc.freezed.dart';
part 'country_event.dart';
part 'country_state.dart';

@injectable
class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final LoadCountryUseCase _loadCountryUseCase;

  CountryBloc(
    this._loadCountryUseCase,
  ) : super(const CountryState()) {
    on<CountryLoadEvent>(_loadCountry);
  }

  void _loadCountry(
    CountryLoadEvent event,
    Emitter<CountryState> emit,
  ) async {
    if (state.countryList == null) {
      emit(state.copyWith(
        status: ListStatus.initial,
        error: null,
      ));
    }
    if (state.countryList != null &&
            (state.countryList?.list.length ?? 0) >=
                (state.countryList?.count ?? 0) ||
        state.status == ListStatus.loading) {
      return;
    }

    emit(state.copyWith(status: ListStatus.loading));
    final response = await _loadCountryUseCase(state.countryList == null
        ? CountryParams()
        : CountryParams(
            offset: (state.countryList!.count ?? 0) <
                    ((state.countryList!.offset ?? 0) +
                        state.countryList!.limit)
                ? state.countryList!.offset ?? 0
                : (state.countryList!.offset ?? 0) + state.countryList!.limit,
          ));
    response.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) {
        print("AAA result.list.length: = ${result.list.length}");
        emit(state.copyWith(
          status: ListStatus.success,
          countryList: CountryList.update(
            countryList: state.countryList ??
                CountryList(
                  count: result.count,
                  limit: result.limit,
                  offset: 0,
                  list: [],
                ),
            list: result.list,
          ),
        ));
      },
    );
    print(
        "AAA totalCount: = ${state.countryList?.count}, list.length: = ${state.countryList?.list.length}");
  }
}
