import 'package:equatable/equatable.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/data/models/country.dart';

class UserLocationEntity extends Equatable {
  const UserLocationEntity({
    this.country,
    this.city,
  });

  final Country? country;
  final City? city;

  @override
  List<Object?> get props => [
        country,
        city,
      ];
}
