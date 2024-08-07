import 'package:food_driver/features/location/data/models/api_list.dart';
import 'package:food_driver/features/location/data/models/country.dart';
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

  factory CountryList.update({
    required CountryList raitingList,
    required List<Country> list,
  }) {
    return CountryList(
      count: raitingList.count,
      limit: raitingList.limit,
      offset: raitingList.offset,
      list: [...raitingList.list, ...list],
    );
  }

  factory CountryList.fromJson(Map<String, dynamic> json) =>
      _$CountryListFromJson(json);
  Map<String, dynamic> toJson() => _$CountryListToJson(this);
}
