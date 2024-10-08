import 'package:flutter/material.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/presentation/widgets/game_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Game extends StatelessWidget {
  const Game({
    super.key,
    required this.type,
    this.reward,
    this.routes = const [],
    required this.markers,
    this.polylines = const <Polyline>{},
    required this.cameraPosition,
  });

  final GameStateType type;
  final num? reward;
  final List<DriveRouteEntity> routes;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final CameraPosition cameraPosition;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case GameStateType.loading:
      case GameStateType.noCity:
        return const SizedBox();
      case GameStateType.initialized:
        return GameMap(
          key: const ValueKey('initialized'),
          routes: routes,
          markers: markers,
          polylines: const {},
          cameraPosition: cameraPosition,
          type: GameStateType.initialized,
        );
      case GameStateType.playing:
      case GameStateType.starting:
        return GameMap(
          key: const ValueKey('playingStarting'),
          routes: routes,
          markers: markers,
          polylines: polylines,
          cameraPosition: cameraPosition,
        );
      case GameStateType.win:
      case GameStateType.loose:
        return GameMap(
          key: const ValueKey('winLoose'),
          routes: routes,
          markers: markers,
          polylines: polylines,
          cameraPosition: cameraPosition,
        );
    }
  }
}
