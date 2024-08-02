import 'package:equatable/equatable.dart';
import 'package:food_driver/features/location/data/models/country.dart';

class CountryListEntity extends Equatable {
  const CountryListEntity({
    this.count,
    this.limit,
    this.offset,
    this.list = const [],
  });

  final int? count;
  final int? limit;
  final int? offset;
  final List<Country> list;

  @override
  List<Object?> get props => [
        count,
        limit,
        offset,
        list,
      ];
}
