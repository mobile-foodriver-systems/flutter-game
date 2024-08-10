import 'package:food_driver/features/location/data/models/api_list.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_list.g.dart';

@JsonSerializable()
class CityList extends ApiList<City> {
  CityList({
    super.count,
    super.offset,
    super.limit,
    super.list,
  });

  factory CityList.update({
    required CityList cityList,
    required List<City> list,
    required int offset,
  }) {
    return CityList(
      count: cityList.count,
      limit: cityList.limit,
      offset: offset,
      list: {...cityList.list, ...list}.toList(),
    );
  }

  factory CityList.fromJson(Map<String, dynamic> json) =>
      _$CityListFromJson(json);
  Map<String, dynamic> toJson() => _$CityListToJson(this);
}
