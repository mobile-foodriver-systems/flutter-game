import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  });

  final List<DriveRouteEntity> routes;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final CameraPosition cameraPosition;

  @override
  State<GameMap> createState() => _GameMapState();
}

class _GameMapState extends State<GameMap> with MapMixin, TickerProviderStateMixin {
  @override
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  LatLngBounds? _visibleRegion;
  Set<Marker> _markers = {};
  List<LatLng> _visibleMarkers = [];
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut);
  }

  @override
  void didUpdateWidget(covariant GameMap oldWidget) {
    if (_markers != widget.markers) {
      _markers = widget.markers;
      _updateVisibleMarkers();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _updateVisibleMarkers() async {
    if (googleMapController == null || _visibleRegion == null) return;

    final visibleMarkers = _markers
        .where((marker) {
          return _visibleRegion!.contains(marker.position);
        })
        .map(
          (e) => e.position,
        )
        .toList();

    if (_visibleMarkers.length != visibleMarkers.length ||
        !_visibleMarkers.every(visibleMarkers.contains)) {
      setState(() {
        _visibleMarkers = visibleMarkers;
      });
      _animationController?.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) async {
        if (state.cameraPosition.target != widget.cameraPosition.target &&
            googleMapController != null) {
          googleMapController!.moveCamera(CameraUpdate.newLatLng(state.cameraPosition.target));
        }
      },
      builder: (BuildContext context, GameState state) {
        return Stack(
          children: [
            GoogleMap(
              onCameraMove: (position) async {
                _visibleRegion = await googleMapController?.getVisibleRegion();
                _updateVisibleMarkers();
              },
              onCameraIdle: () async {
                _visibleRegion = await googleMapController?.getVisibleRegion();
                _updateVisibleMarkers();
              },
              initialCameraPosition: widget.cameraPosition,
              onMapCreated: onMapCreated,
              markers: widget.markers,
              polylines: widget.polylines,
              zoomControlsEnabled: false,
            ),
            if (_visibleMarkers.isNotEmpty)
              FutureBuilder<LatLngBounds>(
                future: googleMapController!.getVisibleRegion(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final bounds = snapshot.data!;
                    return AnimatedBuilder(
                      animation: _animationController!,
                      builder: (context, child) {
                        return CustomPaint(
                          size: Size.infinite,
                          painter: ArrowPainter(
                            bounds,
                            _visibleMarkers,
                            googleMapController!,
                            _animation!.value,
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
          ],
        );
      },
    );
  }
}
