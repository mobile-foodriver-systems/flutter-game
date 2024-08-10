import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country extends Selectable {
  @override
  final int id;
  @override
  final String? name;

  Country({
    required this.id,
    this.name,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Country &&
            other.id == id &&
            other.name == name);
  }

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  int get hashCode => Object.hash(id, name);
}
