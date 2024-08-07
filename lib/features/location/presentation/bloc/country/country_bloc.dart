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
    final response = await _loadCountryUseCase(state.countryList == null
        ? CountryParams()
        : CountryParams(
            offset: (state.countryList!.offset ?? 0) + state.countryList!.limit,
          ));
    response.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) {
        emit(state.copyWith(
          status: ListStatus.success,
          countryList: state.countryList == null
              ? result
              : CountryList.update(
                  raitingList: state.countryList!,
                  list: result.list,
                ),
        ));
      },
    );
  }
}
