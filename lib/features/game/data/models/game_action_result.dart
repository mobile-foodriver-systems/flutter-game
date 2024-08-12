import 'package:food_driver/features/user/data/models/api_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_action_result.g.dart';

@JsonSerializable()
class GameActionResult {
  final bool isSuccess;
  final ApiError? error;

  GameActionResult({
    this.isSuccess = false,
    this.error,
  });

  factory GameActionResult.fromJson(Map<String, dynamic> json) =>
      _$GameActionResultFromJson(json);
  Map<String, dynamic> toJson() => _$GameActionResultToJson(this);
}
