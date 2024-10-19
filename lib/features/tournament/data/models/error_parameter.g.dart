// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorParameter _$ErrorParameterFromJson(Map<String, dynamic> json) =>
    ErrorParameter(
      parameterName: json['parameterName'] as String,
      parameterValue: json['parameterValue'] as String,
      typeName: json['typeName'] as String,
    );

Map<String, dynamic> _$ErrorParameterToJson(ErrorParameter instance) =>
    <String, dynamic>{
      'parameterName': instance.parameterName,
      'parameterValue': instance.parameterValue,
      'typeName': instance.typeName,
    };
