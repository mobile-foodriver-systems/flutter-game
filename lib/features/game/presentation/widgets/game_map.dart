import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/presentation/bloc/game/game_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'package:food_driver/features/game/presentation/pages/mixins/map_mixin.dart';

class GameMap extends StatefulWidget {
  const GameMap({
    super.key,
    required this.routes,
    required this.markers,
    required this.polylines,
    required this.cameraPosition,
  });

  final List<DriveRouteEntity> routes;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final CameraPosition cameraPosition;

  @override
  State<GameMap> createState() => _GameMapState();
}

class _GameMapState extends State<GameMap> with MapMixin {
  @override
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) async {
        if (state.cameraPosition.target != widget.cameraPosition.target &&
            googleMapController != null) {
          googleMapController!
              .moveCamera(CameraUpdate.newLatLng(state.cameraPosition.target));
        }
      },
      builder: (BuildContext context, GameState state) {
        return GoogleMap(
          initialCameraPosition: widget.cameraPosition,
          onMapCreated: onMapCreated,
          markers: widget.markers,
          polylines: widget.polylines,
          zoomControlsEnabled: false,
        );
      },
    );
  }
}
