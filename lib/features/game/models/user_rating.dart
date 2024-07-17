import 'package:json_annotation/json_annotation.dart';

part 'user_rating.g.dart';

@JsonSerializable()
class UserRating {
  final String? name;
  final int? position;

  const UserRating({
    this.name,
    this.position = 0,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) =>
      _$UserRatingFromJson(json);
  Map<String, dynamic> toJson() => _$UserRatingToJson(this);
}
