import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/tournament/data/models/smart_contract_error.dart';
import 'package:food_driver/features/user/data/models/api_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'participate_error.g.dart';

@JsonSerializable()
class ParticipateError implements Failure {
  final String? errorCode;
  @override
  @JsonKey(name: 'errorMessage')
  final String? message;
  final SmartContractError? smartContractError;
  final List<ApiError> errors;

  ParticipateError({
    this.errorCode,
    this.message,
    this.smartContractError,
    this.errors = const [],
  });

  @override
  List<Object?> get props => [
        errorCode,
        message,
        smartContractError,
        errors,
      ];

  @override
  bool? get stringify => null;

  factory ParticipateError.fromFailure(Failure failure) {
    return ParticipateError(message: failure.message);
  }

  factory ParticipateError.fromJson(Map<String, dynamic> json) =>
      _$ParticipateErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipateErrorToJson(this);
}
