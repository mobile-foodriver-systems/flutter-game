part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

final class CityLoadEvent extends CityEvent {
  const CityLoadEvent({
    this.searchText,
    required this.countryId,
  });

  final String? searchText;
  final int countryId;

  @override
  List<Object> get props => [
        if (searchText != null) searchText!,
        countryId,
      ];
}
