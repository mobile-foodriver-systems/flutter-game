import 'package:easy_localization/easy_localization.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

enum UsersSortType {
  global,
  distance;

  String get title {
    switch (this) {
      case UsersSortType.global:
        return LocaleKeys.progressListPageGlobal.tr();
      case UsersSortType.distance:
        return LocaleKeys.progressListPageDistanceRadius.tr();
    }
  }

  int? get value {
    switch (this) {
      case UsersSortType.global:
        return null;
      case UsersSortType.distance:
        return 100;
    }
  }
}
