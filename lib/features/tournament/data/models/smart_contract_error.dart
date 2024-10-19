import 'package:food_driver/features/tournament/data/models/error_parameter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_contract_error.g.dart';

@JsonSerializable()
class SmartContractError {
  final String errorName;
  final String message;
  final String revertMessage;
  final List<ErrorParameter> errorParameterList;

  SmartContractError({
    required this.errorName,
    required this.message,
    required this.revertMessage,
    required this.errorParameterList,
  });

  factory SmartContractError.fromJson(Map<String, dynamic> json) =>
      _$SmartContractErrorFromJson(json);
  Map<String, dynamic> toJson() => _$SmartContractErrorToJson(this);
}
