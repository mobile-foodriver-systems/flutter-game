// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_contract_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartContractError _$SmartContractErrorFromJson(Map<String, dynamic> json) =>
    SmartContractError(
      errorName: json['errorName'] as String,
      message: json['message'] as String,
      revertMessage: json['revertMessage'] as String,
      errorParameterList: (json['errorParameterList'] as List<dynamic>)
          .map((e) => ErrorParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SmartContractErrorToJson(SmartContractError instance) =>
    <String, dynamic>{
      'errorName': instance.errorName,
      'message': instance.message,
      'revertMessage': instance.revertMessage,
      'errorParameterList': instance.errorParameterList,
    };
