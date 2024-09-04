import 'package:food_driver/core/ui/view/bi_directional_scroll_view.dart';
import 'package:food_driver/features/game/data/models/user_rating.dart';
import 'package:food_driver/features/location/data/models/api_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_list.g.dart';

@JsonSerializable()
class RatingList extends ApiList<UserRating> {
  RatingList({
    super.list = const [],
  });

  factory RatingList.update({
    required RatingList ratingList,
    required List<UserRating> list,
    Direction? direction,
  }) {
    return RatingList(
      list: direction == Direction.up
          ? {
              ...list,
              ...ratingList.list,
            }.toList()
          : {
              ...ratingList.list,
              ...list,
            }.toList(),
    );
  }

  factory RatingList.fromJson(Map<String, dynamic> json) =>
      _$RatingListFromJson(json);

  Map<String, dynamic> toJson() => _$RatingListToJson(this);
}
