import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/presentation/bloc/game/game_bloc.dart';
import 'package:food_driver/features/game/presentation/widgets/painters/arrow_painter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'package:food_driver/features/game/presentation/pages/mixins/map_mixin.dart';

class GameMap extends StatefulWidget {
  const GameMap({
    super.key,
    required this.routes,
    required this.markers,
    required this.polylines,
    required this.cameraPosition,
    this.type,
  });

  final List<DriveRouteEntity> routes;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final CameraPosition cameraPosition;
  final GameStateType? type;

  @override
  State<GameMap> createState() => _GameMapState();
}

class _GameMapState extends State<GameMap>
    with MapMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: listener,
      builder: (BuildContext context, GameState state) {
        return Stack(
          children: [
            GoogleMap(
              onMapCreated: onMapCreated,
              onCameraMove: onCameraMove,
              onCameraIdle: onCameraIdle,
              initialCameraPosition: widget.cameraPosition,
              markers: _markers,
              polylines: widget.polylines,
              zoomControlsEnabled: false,
            ),
            if (_outsideMarkers.isNotEmpty)
              IgnorePointer(
                child: DirectionIndicatorWidget(
                  center: screenCenter,
                  points: _outsideMarkers,
                ),
              ),
          ],
        );
      },
    );
  }
}
