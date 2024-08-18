import 'package:flutter/material.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/presentation/widgets/game_map.dart';
import 'package:food_driver/generated/l10n.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Game extends StatelessWidget {
  const Game({
    super.key,
    required this.type,
    this.reward,
    this.routes = const [],
    required this.markers,
    this.polylines = const <Polyline>{},
    required this.determineLocation,
  });

  final GameStateType type;
  final num? reward;
  final List<DriveRouteEntity> routes;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final VoidCallback determineLocation;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case GameStateType.error:
      case GameStateType.loading:
        return const SizedBox();
      case GameStateType.noCity:
        return _NoCity(determineLocation: determineLocation);
      case GameStateType.initialized:
        return GameMap(
          key: const ValueKey('initialized'),
          routes: routes,
          markers: markers,
          polylines: const {},
        );
      case GameStateType.playing:
      case GameStateType.starting:
      case GameStateType.win:
      case GameStateType.loose:
        return GameMap(
          routes: routes,
          markers: markers,
          polylines: polylines,
        );
    }
  }
}

class _NoCity extends StatelessWidget {
  const _NoCity({required this.determineLocation});

  final VoidCallback determineLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: determineLocation,
          child: Text(S.current.gamePageDetermineTheLocation),
        ),
      ),
    );
  }
}
