import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_rating.g.dart';

@JsonSerializable()
class UserRating extends Selectable {
  @override
  final int id;
  final num? balanceInFDT;
  final num? number;
  final String? userName;

  UserRating({
    required this.id,
    this.balanceInFDT = 0,
    this.number = 0,
    this.userName,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) =>
      _$UserRatingFromJson(json);
  Map<String, dynamic> toJson() => _$UserRatingToJson(this);

  @override
  String? get name => userName;
}
