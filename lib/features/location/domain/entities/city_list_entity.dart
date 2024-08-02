import 'package:equatable/equatable.dart';
import 'package:food_driver/features/location/data/models/city.dart';

class CityListEntity extends Equatable {
  const CityListEntity({
    this.count,
    this.limit,
    this.offset,
    this.list = const [],
  });

  final int? count;
  final int? limit;
  final int? offset;
  final List<City> list;

  @override
  List<Object?> get props => [
        count,
        limit,
        offset,
        list,
      ];
}
