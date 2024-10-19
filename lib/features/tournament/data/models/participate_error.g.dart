// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participate_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipateError _$ParticipateErrorFromJson(Map<String, dynamic> json) =>
    ParticipateError(
      errorCode: json['errorCode'] as String?,
      message: json['errorMessage'] as String?,
      smartContractError: SmartContractError.fromJson(
          json['smartContractError'] as Map<String, dynamic>),
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => ApiError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ParticipateErrorToJson(ParticipateError instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.message,
      'smartContractError': instance.smartContractError,
      'errors': instance.errors,
    };
