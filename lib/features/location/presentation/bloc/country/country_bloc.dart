import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'country_bloc.freezed.dart';
part 'country_event.dart';
part 'country_state.dart';

@injectable
class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(const CountryState());
}
