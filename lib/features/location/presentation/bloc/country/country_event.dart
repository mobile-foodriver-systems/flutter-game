part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

final class CountryLoadEvent extends CountryEvent {
  const CountryLoadEvent();

  @override
  List<Object> get props => [];
}
