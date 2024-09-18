import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocaleService {
  LocaleService();
  Locale? locale;

  String get languageCode => locale?.languageCode ?? "en";
}
