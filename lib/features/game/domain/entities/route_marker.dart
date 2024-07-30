import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/presentation/widgets/rps_custom_painter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteMarker {
  static Future<BitmapDescriptor?> createCustomMarkerBitmap({
    required num reward,
    required int seconds,
  }) async {
    var tp = CustomPaint(
      size: const Size(111, 51),
      painter: RPSCustomPainter(), //DemoPainter(Colors.black),
    );

    PictureRecorder recorder = PictureRecorder();
    Canvas canvas = Canvas(recorder);

    tp.painter?.paint(canvas, const Size(111.0, 51.0));

    Picture p = recorder.endRecording();
    ByteData? pngBytes = await (await p.toImage(
      tp.size.width.toInt(),
      tp.size.height.toInt(),
    ))
        .toByteData(format: ImageByteFormat.png);
    if (pngBytes != null) {
      Uint8List data = Uint8List.view(pngBytes.buffer);
      return BitmapDescriptor.bytes(data);
    }
    return null;
  }

  static Future<Set<Marker>> createMarkers({
    required List<DriveRouteEntity> routes,
    required void Function(DriveRouteEntity) onTap,
  }) async {
    var markers = <Marker>{};
    for (var route in routes) {
      BitmapDescriptor? bitmapDescriptor =
          await RouteMarker.createCustomMarkerBitmap(
        reward: route.reward,
        seconds: route.seconds,
      );
      if (bitmapDescriptor != null) {
        markers.add(Marker(
          icon: bitmapDescriptor,
          markerId: MarkerId(route.id.toString()),
          position:
              LatLng(route.startPoint!.latitude, route.startPoint!.longitude),
          onTap: () => onTap(route),
        ));
      }
    }
    return markers;
  }
}
