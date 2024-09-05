import 'dart:async';
import 'dart:ui';

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

  CameraPosition? _cameraPosition;
  Set<Marker> _markers = {};
  List<Offset> _outsideMarkers = [];

  Offset screenCenter = Offset.zero;
  final screenRect = Rect.fromPoints(
      Offset.zero, PlatformDispatcher.instance.views.first.physicalSize.bottomRight(Offset.zero));

  @override
  void didUpdateWidget(covariant GameMap oldWidget) {
    if (_markers != widget.markers) {
      _markers = widget.markers;
      _updateArrows();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _updateArrows() async {
    if (googleMapController == null || _cameraPosition == null) return;

    final screemCoordinate =
        await googleMapController!.getScreenCoordinate(_cameraPosition!.target);
    screenCenter = Offset(
      screemCoordinate.x.toDouble(),
      screemCoordinate.y.toDouble(),
    );

    // print('screenCenter: $screenCenter');

    final newMarkers = <Offset>[];
    for (var marker in _markers) {
      final screemCoordinate = await googleMapController!.getScreenCoordinate(marker.position);
      final offset = Offset(
        screemCoordinate.x.toDouble(),
        screemCoordinate.y.toDouble(),
      );
      if (!screenRect.contains(offset)) newMarkers.add(offset);
    }

    // Обновляем список стрелок и запускаем анимацию
    setState(() {
      _outsideMarkers = newMarkers;
    });
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
              onMapCreated: (controller) {
                if (mounted) {
                  onMapCreated(controller);
                  // Изначальное обновление стрелок после создания карты
                  if (mounted) {
                    _updateArrows();
                  }
                }
              },
              onCameraMove: (position) async {
                _cameraPosition = position;
                _updateArrows();
              },
              onCameraIdle: () {
                // Дополнительное обновление при остановке камеры
                if (googleMapController != null) {
                  _updateArrows();
                }
              },
              initialCameraPosition: widget.cameraPosition,
              markers: _markers,
              polylines: widget.polylines,
              zoomControlsEnabled: false,
            ),
            if (_outsideMarkers.isNotEmpty && _cameraPosition != null)
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

  Offset getBoundsCenter(LatLngBounds bounds) {
    double centerLat = (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
    double centerLng = (bounds.northeast.longitude + bounds.southwest.longitude) / 2;

    return Offset(centerLat, centerLng);
  }
}
