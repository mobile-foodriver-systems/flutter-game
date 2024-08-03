// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_stack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorStack _$ApiErrorStackFromJson(Map<String, dynamic> json) =>
    ApiErrorStack(
      errorCode: json['errorCode'] as String?,
      message: json['errorMessage'] as String?,
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => ApiError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ApiErrorStackToJson(ApiErrorStack instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.message,
      'errors': instance.errors,
    };
