import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/domain/entities/marker_entity.dart';
import 'package:food_driver/features/game/domain/entities/route_marker.dart';
import 'package:food_driver/features/game/presentation/bloc/game_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'package:food_driver/features/game/presentation/pages/mixins/map_mixin.dart';

class GameMap extends StatefulWidget {
  const GameMap({
    super.key,
    required this.routes,
    required this.markers,
    required this.polylines,
  });

  final List<DriveRouteEntity> routes;
  final Set<Marker> markers;
  final Set<Polyline> polylines;

  @override
  State<GameMap> createState() => _GameMapState();
}

class _GameMapState extends State<GameMap> with MapMixin {
  static const LatLng _defaultPosition =
      LatLng(55.75399399999374, 37.62209300000001);
  static const double defaultZoom = 14.4746;

  @override
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late LatLng target = findInitPosition(_defaultPosition);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: target,
        zoom: defaultZoom,
      ),
      onMapCreated: onMapCreated,
      markers: widget.markers,
      polylines: widget.polylines,
      zoomControlsEnabled: false,
    );
  }
}
