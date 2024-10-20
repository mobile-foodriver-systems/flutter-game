import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:food_driver/features/game/domain/entities/marker_entity.dart';

class RouteMarker {
  static final Map<MarkerType, BitmapDescriptor> _markersDescriptions = {};

  static Future<void> preapareBitmaps() async {
    if (_markersDescriptions.isNotEmpty) return;
    for (final markerType in MarkerType.values) {
      if (markerType == MarkerType.driver) {
        _markersDescriptions[markerType] =
            await _svgToBitmapDescriptor('assets/user.svg');
        continue;
      }
      if (markerType == MarkerType.finish) {
        _markersDescriptions[markerType] =
            await _svgToBitmapDescriptor('assets/finish.svg');
        continue;
      }
      var tp = markerType.staticPainter();
      _markersDescriptions[markerType] = await tp.toBitmapDescriptor();
    }
  }

  static Future<BitmapDescriptor?> createCustomMarkerBitmap({
    required MarkerEntity marker,
  }) async {
    var tp = marker.markerType.painter(
      reward: marker.reward,
      seconds: marker.seconds,
    );
    return tp.toBitmapDescriptor();
  }

  static Set<Marker> getMarkers({
    required Set<MarkerEntity> entities,
    Function(int routeId)? onTap,
  }) {
    var markers = <Marker>{};
    for (var markerEntity in entities) {
      BitmapDescriptor? bitmapDescriptor =
          _markersDescriptions[markerEntity.markerType];
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

  static Future<BitmapDescriptor> _svgToBitmapDescriptor(
      String svgAssetPath) async {
    return SvgPicture.asset(svgAssetPath).toBitmapDescriptor();
  }
}

extension _ToBitDescription on Widget {
  Future<BitmapDescriptor> toBitmapDescriptor() async {
    final (pngBytes, width, height) = await _createImageFromWidget(
      RepaintBoundary(
        child: MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: this,
          ),
        ),
      ),
    );
    final view = ui.PlatformDispatcher.instance.views.first;
    return BitmapDescriptor.bytes(
      pngBytes,
      width: width / view.devicePixelRatio,
      height: height / view.devicePixelRatio,
    );
  }
}

Future<(Uint8List, int, int)> _createImageFromWidget(Widget widget) async {
  final repaintBoundary = RenderRepaintBoundary();
  final view = ui.PlatformDispatcher.instance.views.first;
  final renderView = RenderView(
    view: view,
    child: RenderPositionedBox(
      alignment: Alignment.center,
      child: repaintBoundary,
    ),
    configuration: ViewConfiguration.fromView(view),
  );
  final pipelineOwner = PipelineOwner();
  final buildOwner = BuildOwner(focusManager: FocusManager());
  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();
  final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: widget,
  ).attachToRenderTree(buildOwner);
  buildOwner.buildScope(rootElement);
  await Future.delayed(const Duration(milliseconds: 300));
  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();
  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();
  final ui.Image image = await repaintBoundary.toImage(
    pixelRatio: view.devicePixelRatio,
  );
  final ByteData? byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  return (byteData!.buffer.asUint8List(), image.width, image.height);
}
