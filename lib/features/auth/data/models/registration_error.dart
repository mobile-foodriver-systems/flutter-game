import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/auth/data/models/reg_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_error.g.dart';

@JsonSerializable()
class RegistrationError implements Failure {
  final String? errorCode;
  final List<RegError> errors;
  @override
  @JsonKey(name: "errorMessage")
  final String? message;

  const RegistrationError({
    this.errorCode,
    this.errors = const [],
    this.message,
  });

  @override
  List<Object?> get props => [
        errorCode,
        errors,
        message,
      ];

  factory RegistrationError.fromFailure(Failure failure) {
    return RegistrationError(message: failure.message);
  }

  factory RegistrationError.fromJson(Map<String, dynamic> json) =>
      _$RegistrationErrorFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationErrorToJson(this);

  @override
  bool? get stringify => null;
}
