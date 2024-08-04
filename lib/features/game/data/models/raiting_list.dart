import 'package:food_driver/features/game/data/models/user_rating.dart';
import 'package:food_driver/features/location/data/models/api_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'raiting_list.g.dart';

@JsonSerializable()
class RaitingList extends ApiList<UserRating> {
  RaitingList({
    super.count,
    super.offset,
    super.limit,
    super.list = const [],
  });

  factory RaitingList.update({
    required RaitingList raitingList,
    required List<UserRating> list,
  }) {
    return RaitingList(
      count: raitingList.count,
      limit: raitingList.limit,
      offset: raitingList.offset,
      list: [...raitingList.list, ...list],
    );
  }

  factory RaitingList.fromJson(Map<String, dynamic> json) =>
      _$RaitingListFromJson(json);
  Map<String, dynamic> toJson() => _$RaitingListToJson(this);
}
