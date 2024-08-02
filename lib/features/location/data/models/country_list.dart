import 'package:food_driver/features/location/data/models/api_list.dart';
import 'package:food_driver/features/location/data/models/country.dart';
import 'package:food_driver/features/location/domain/entities/country_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_list.g.dart';

@JsonSerializable()
class CountryList extends ApiList<Country> {
  CountryList({
    super.count,
    super.offset,
    super.limit,
    super.list,
  });

  factory CountryList.fromJson(Map<String, dynamic> json) =>
      _$CountryListFromJson(json);
  Map<String, dynamic> toJson() => _$CountryListToJson(this);
}

extension CountryListX on CountryList {
  CountryListEntity toEntity() {
    return CountryListEntity(
      count: count,
      offset: offset,
      limit: limit,
      list: list,
    );
  }
}
