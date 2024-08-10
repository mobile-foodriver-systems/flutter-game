part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

final class CountryLoadEvent extends CountryEvent {
  const CountryLoadEvent({this.searchText});

  final String? searchText;

  @override
  List<Object> get props => [
        if (searchText != null) searchText!,
      ];
}
