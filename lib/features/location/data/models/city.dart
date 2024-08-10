import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City extends Selectable {
  @override
  final int id;
  @override
  final String? name;
  final int countryId;

  City({
    required this.id,
    this.name,
    required this.countryId,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is City &&
            other.id == id &&
            other.name == name &&
            other.countryId == countryId);
  }

  @override
  int get hashCode => Object.hash(id, name, countryId);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
