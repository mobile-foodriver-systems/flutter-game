part of 'base_location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

final class LoadEvent extends LocationEvent {
  const LoadEvent({this.searchText});

  final String? searchText;

  @override
  List<Object> get props => [
        if (searchText != null) searchText!,
      ];
}
