import 'package:food_driver/features/localization/data/models/phrases_dictionary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supported_locales.g.dart';

@JsonSerializable()
class SupportedLocales {
  final PhrasesDictionary? en;
  final PhrasesDictionary? ru;
  final PhrasesDictionary? ro;
  final PhrasesDictionary? tr;
  final PhrasesDictionary? xog;
  final PhrasesDictionary? fr;
  final PhrasesDictionary? he;
  final PhrasesDictionary? ar;

  SupportedLocales(
    this.en,
    this.ru,
    this.ro,
    this.tr,
    this.xog,
    this.fr,
    this.he,
    this.ar,
  );

  factory SupportedLocales.fromJson(Map<String, dynamic> json) =>
      _$SupportedLocalesFromJson(json);
  Map<String, dynamic> toJson() => _$SupportedLocalesToJson(this);
}
