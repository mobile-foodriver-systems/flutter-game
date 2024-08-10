import 'package:bloc/bloc.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/location/data/models/city_list.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:food_driver/features/location/domain/usecases/load_city.dart';
import 'package:food_driver/features/location/presentation/bloc/base_location_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'city_bloc.freezed.dart';
part 'city_event.dart';
part 'city_state.dart';

@injectable
class CityBloc extends BaseLocationBloc {
  CityBloc(super._loadCountryUseCase, super._loadCityUseCase) {
    // on<CityLoadEvent>(_loadCity);
  }

  void _loadCity(
    CityLoadEvent event,
    Emitter<CityState> emit,
  ) {}
}
