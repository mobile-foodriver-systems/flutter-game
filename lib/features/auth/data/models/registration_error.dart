import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/auth/data/models/reg_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_error.g.dart';

@JsonSerializable()
class RegistrationError extends Failure {
  final String? errorCode;
  final String? errorMessage;
  final List<RegError> errors;
  @override
  @JsonKey(
    name: "errorMessage",
    includeToJson: false,
    includeFromJson: false,
  )
  final String? message;

  const RegistrationError({
    this.errorCode,
    this.errorMessage,
    this.errors = const [],
    this.message,
  });

  @override
  List<Object?> get props => [
        errorCode,
        errorMessage,
        errors,
        message,
      ];

  factory RegistrationError.fromJson(Map<String, dynamic> json) =>
      _$RegistrationErrorFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationErrorToJson(this);
}
