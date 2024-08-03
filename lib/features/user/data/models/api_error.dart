import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError implements Failure {
  final String? errorCode;
  @override
  @JsonKey(name: 'errorMessage')
  final String? message;

  ApiError({
    this.errorCode,
    this.message,
  });

  factory ApiError.fromFailure(Failure failure) {
    return ApiError(message: failure.message);
  }

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @override
  List<Object?> get props => [
        errorCode,
        message,
      ];

  @override
  bool? get stringify => null;
}
