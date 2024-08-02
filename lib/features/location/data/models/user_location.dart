import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/data/models/country.dart';
import 'package:food_driver/features/location/domain/entities/user_location_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_location.g.dart';

@JsonSerializable()
class UserLocation {
  final City? city;
  final Country? country;

  UserLocation({
    this.city,
    this.country,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);
  Map<String, dynamic> toJson() => _$UserLocationToJson(this);
}

extension UserLocationX on UserLocation {
  UserLocationEntity toEntity() {
    return UserLocationEntity(
      city: city,
      country: country,
    );
  }
}
