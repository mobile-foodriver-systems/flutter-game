// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthError _$AuthErrorFromJson(Map<String, dynamic> json) => AuthError(
      error: json['error'] as String?,
      errorDescription: json['error_description'] as String?,
    );

Map<String, dynamic> _$AuthErrorToJson(AuthError instance) => <String, dynamic>{
      'error': instance.error,
      'error_description': instance.errorDescription,
    };
