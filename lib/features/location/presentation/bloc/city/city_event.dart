part of 'city_bloc.dart';

final class CityLoadEvent extends LocationEvent {
  const CityLoadEvent({this.searchText});

  final String? searchText;

  @override
  List<Object> get props => [if (searchText != null) searchText!];
}
