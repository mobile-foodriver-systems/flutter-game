import 'package:food_driver/features/location/data/models/api_list.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/domain/entities/city_list_entity.dart';
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

  factory CityList.fromJson(Map<String, dynamic> json) =>
      _$CityListFromJson(json);
  Map<String, dynamic> toJson() => _$CityListToJson(this);
}

extension CityListX on CityList {
  CityListEntity toEntity() {
    return CityListEntity(
      count: count,
      offset: offset,
      limit: limit,
      list: list,
    );
  }
}
