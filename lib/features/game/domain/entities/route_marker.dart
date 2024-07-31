import 'dart:typed_data';
import 'dart:ui';

import 'package:food_driver/features/game/domain/entities/marker_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteMarker {
  static Future<BitmapDescriptor?> createCustomMarkerBitmap({
    required MarkerEntity marker,
  }) async {
    var tp = marker.markerType.painter;

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
