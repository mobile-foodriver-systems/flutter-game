enum UsersSortType {
  global,
  distance;

  String get title {
    switch (this) {
      case UsersSortType.global:
        return "Глобальный";
      case UsersSortType.distance:
        return "В радиусе 100 км";
    }
  }
}
