import 'package:json_annotation/json_annotation.dart';

part 'auth_error.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthError {
  AuthError({
    this.error,
    this.errorDescription,
  });

  final String? error;
  final String? errorDescription;

  factory AuthError.fromJson(Map<String, dynamic> json) =>
      _$AuthErrorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthErrorToJson(this);
}
