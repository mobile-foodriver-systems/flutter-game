import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/user/data/models/api_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_stack.g.dart';

@JsonSerializable()
class ApiErrorStack implements Failure {
  final String? errorCode;
  @override
  @JsonKey(name: 'errorMessage')
  final String? message;
  final List<ApiError> errors;

  ApiErrorStack({
    this.errorCode,
    this.message,
    this.errors = const [],
  });

  factory ApiErrorStack.fromFailure(Failure failure) {
    return ApiErrorStack(message: failure.message);
  }

  factory ApiErrorStack.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorStackFromJson(json);
  Map<String, dynamic> toJson() => _$ApiErrorStackToJson(this);

  @override
  List<Object?> get props => [
        errorCode,
        message,
        errors,
      ];

  @override
  bool? get stringify => null;
}
