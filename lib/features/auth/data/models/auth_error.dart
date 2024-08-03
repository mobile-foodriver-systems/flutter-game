import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_error.g.dart';

@JsonSerializable()
class AuthError implements Failure {
  const AuthError({
    this.error,
    this.message,
  });

  final String? error;
  @override
  @JsonKey(name: 'error_description')
  final String? message;

  factory AuthError.fromFailure(Failure failure) {
    return AuthError(message: failure.message);
  }

  factory AuthError.fromJson(Map<String, dynamic> json) =>
      _$AuthErrorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthErrorToJson(this);

  @override
  List<Object?> get props => [
        error,
        message,
      ];

  @override
  bool? get stringify => null;
}
