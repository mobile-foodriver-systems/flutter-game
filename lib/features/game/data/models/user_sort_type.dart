import 'package:food_driver/generated/l10n.dart';

enum UsersSortType {
  global,
  distance;

  String get title {
    switch (this) {
      case UsersSortType.global:
        return S.current.progressListPageGlobal;
      case UsersSortType.distance:
        return S.current.progressListPageDistanceRadius;
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
