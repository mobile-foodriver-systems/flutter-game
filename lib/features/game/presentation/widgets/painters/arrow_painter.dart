import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ArrowPainter extends CustomPainter {
  final LatLngBounds bounds;
  final List<LatLng> points;
  final GoogleMapController mapController;
  final double animationValue;

  ArrowPainter(this.bounds, this.points, this.mapController, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) async {
    final paint = Paint()
      ..color = Colors.red.withOpacity(animationValue)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final centerLatLng = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );

    final centerPoint = await mapController.getScreenCoordinate(centerLatLng);
    final centerOffset = Offset(centerPoint.x.toDouble(), centerPoint.y.toDouble());

    for (final point in points) {
      final targetPoint = await mapController.getScreenCoordinate(point);
      final targetOffset = Offset(targetPoint.x.toDouble(), targetPoint.y.toDouble());

      final direction = targetOffset - centerOffset;
      final normalizedDirection = direction / direction.distance;

      final xFactor = size.width / 2 / normalizedDirection.dx;
      final yFactor = size.height / 2 / normalizedDirection.dy;
      final factor = min(xFactor.abs(), yFactor.abs());

      final intersection = centerOffset + normalizedDirection * factor;

      const arrowLength = 20.0;
      const arrowAngle = pi / 6;

      final arrowStart = intersection;
      final arrowEnd1 = intersection -
          normalizedDirection * arrowLength +
          rotateVector(normalizedDirection, arrowAngle) * arrowLength;
      final arrowEnd2 = intersection -
          normalizedDirection * arrowLength +
          rotateVector(normalizedDirection, -arrowAngle) * arrowLength;

      canvas.drawLine(centerOffset, intersection, paint);
      canvas.drawLine(arrowStart, arrowEnd1, paint);
      canvas.drawLine(arrowStart, arrowEnd2, paint);
    }
  }

  Offset rotateVector(Offset vector, double angle) {
    final sinAngle = sin(angle);
    final cosAngle = cos(angle);
    return Offset(
      vector.dx * cosAngle - vector.dy * sinAngle,
      vector.dx * sinAngle + vector.dy * cosAngle,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
