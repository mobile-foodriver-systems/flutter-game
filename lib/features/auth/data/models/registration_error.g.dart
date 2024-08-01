// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationError _$RegistrationErrorFromJson(Map<String, dynamic> json) =>
    RegistrationError(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => RegError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RegistrationErrorToJson(RegistrationError instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'errors': instance.errors,
    };
