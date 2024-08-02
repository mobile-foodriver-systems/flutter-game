import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'city_bloc.freezed.dart';
part 'city_event.dart';
part 'city_state.dart';

@injectable
class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(const CityState());
}
