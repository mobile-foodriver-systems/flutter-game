// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supported_locales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportedLocales _$SupportedLocalesFromJson(Map<String, dynamic> json) =>
    SupportedLocales(
      json['en'] == null
          ? null
          : PhrasesDictionary.fromJson(json['en'] as Map<String, dynamic>),
      json['ru'] == null
          ? null
          : PhrasesDictionary.fromJson(json['ru'] as Map<String, dynamic>),
      json['ro'] == null
          ? null
          : PhrasesDictionary.fromJson(json['ro'] as Map<String, dynamic>),
      json['tr'] == null
          ? null
          : PhrasesDictionary.fromJson(json['tr'] as Map<String, dynamic>),
      json['xog'] == null
          ? null
          : PhrasesDictionary.fromJson(json['xog'] as Map<String, dynamic>),
      json['fr'] == null
          ? null
          : PhrasesDictionary.fromJson(json['fr'] as Map<String, dynamic>),
      json['he'] == null
          ? null
          : PhrasesDictionary.fromJson(json['he'] as Map<String, dynamic>),
      json['ar'] == null
          ? null
          : PhrasesDictionary.fromJson(json['ar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupportedLocalesToJson(SupportedLocales instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ru': instance.ru,
      'ro': instance.ro,
      'tr': instance.tr,
      'xog': instance.xog,
      'fr': instance.fr,
      'he': instance.he,
      'ar': instance.ar,
    };
