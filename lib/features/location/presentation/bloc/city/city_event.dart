part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

final class CityLoadEvent extends CityEvent {
  const CityLoadEvent();

  @override
  List<Object> get props => [];
}
