import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class GameMap extends StatefulWidget {
  const GameMap({super.key});

  @override
  State<GameMap> createState() => _GameMapState();
}

class _GameMapState extends State<GameMap> {
  @override
  Widget build(BuildContext context) {
    return const YandexMap();
  }
}
