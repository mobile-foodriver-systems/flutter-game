part of 'country_bloc.dart';

final class CountryLoadEvent extends LocationEvent {
  const CountryLoadEvent({this.searchText});

  final String? searchText;

  @override
  List<Object> get props => [
        if (searchText != null) searchText!,
      ];
}
