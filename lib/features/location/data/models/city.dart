import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final int id;
  final String? name;
  final int countryId;

  const City({
    required this.id,
    this.name,
    required this.countryId,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
