import 'package:json_annotation/json_annotation.dart';

part 'reg_error.g.dart';

@JsonSerializable()
class RegError {
  final String? errorCode;
  final String? errorMessage;
  
  RegError({
    this.errorCode,
    this.errorMessage,
  });

  factory RegError.fromJson(Map<String, dynamic> json) =>
      _$RegErrorFromJson(json);
  Map<String, dynamic> toJson() => _$RegErrorToJson(this);
}
