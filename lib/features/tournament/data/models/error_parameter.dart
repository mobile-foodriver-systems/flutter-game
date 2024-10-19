import 'package:json_annotation/json_annotation.dart';

part 'error_parameter.g.dart';

@JsonSerializable()
class ErrorParameter {
  final String parameterName;
  final String parameterValue;
  final String typeName;

  ErrorParameter({
    required this.parameterName,
    required this.parameterValue,
    required this.typeName,
  });

  factory ErrorParameter.fromJson(Map<String, dynamic> json) =>
      _$ErrorParameterFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorParameterToJson(this);
}
