import 'dart:typed_data';
import 'dart:ui';

import 'package:food_driver/features/game/domain/entities/marker_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteMarker {
  static final Map<MarkerType, BitmapDescriptor> _markersDescriptions = {};

  static Future<void> preapareBitmaps() async {
    if (_markersDescriptions.isNotEmpty) return;
    for (final markerType in MarkerType.values) {
      var tp = markerType.staticPainter();

      PictureRecorder recorder = PictureRecorder();
      Canvas canvas = Canvas(recorder);
      tp.painter?.paint(canvas, const Size(55.0, 55.0));

      Picture p = recorder.endRecording();
      ByteData? pngBytes = await (await p.toImage(
        tp.size.width.toInt(),
        tp.size.height.toInt(),
      ))
          .toByteData(format: ImageByteFormat.png);
      if (pngBytes != null) {
        Uint8List data = Uint8List.view(pngBytes.buffer);
        _markersDescriptions[markerType] = BitmapDescriptor.bytes(data);
      }
    }
  }

  static Future<BitmapDescriptor?> createCustomMarkerBitmap({
    required MarkerEntity marker,
  }) async {
    var tp = marker.markerType.painter(
      reward: marker.reward,
      seconds: marker.seconds,
    );

    PictureRecorder recorder = PictureRecorder();
    Canvas canvas = Canvas(recorder);
    tp.painter?.paint(canvas, const Size(55.0, 55.0));

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

  static Set<Marker> getMarkers({
    required Set<MarkerEntity> entities,
    Function(int routeId)? onTap,
  }) {
    var markers = <Marker>{};
    for (var markerEntity in entities) {
      BitmapDescriptor? bitmapDescriptor = _markersDescriptions[markerEntity.markerType];
      if (bitmapDescriptor != null) {
        markers.add(Marker(
          icon: bitmapDescriptor,
          markerId: MarkerId(markerEntity.markerId.toString()),
          position: markerEntity.coordinate,
          anchor: const Offset(0.5, 0.5),
          onTap: markerEntity.markerType != MarkerType.route
              ? null
              : () => onTap?.call(markerEntity.markerId),
        ));
      }
    }
    return markers;
  }

  static Future<Set<Marker>> createMarkers({
    required Set<MarkerEntity> entities,
    Function(int routeId)? onTap,
  }) async {
    var markers = <Marker>{};
    for (var markerEntity in entities) {
      BitmapDescriptor? bitmapDescriptor =
          await RouteMarker.createCustomMarkerBitmap(marker: markerEntity);
      if (bitmapDescriptor != null) {
        markers.add(Marker(
          icon: bitmapDescriptor,
          markerId: MarkerId(markerEntity.markerId.toString()),
          position: markerEntity.coordinate,
          onTap: markerEntity.markerType != MarkerType.route
              ? null
              : () => onTap?.call(markerEntity.markerId),
        ));
      }
    }
    return markers;
  }
}
