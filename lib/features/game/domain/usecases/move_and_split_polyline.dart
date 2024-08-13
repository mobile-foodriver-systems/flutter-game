import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@injectable
class MoveAndSplitPolylineUseCase {
  (LatLng currentPosition, List<LatLng> polylineBefore, List<LatLng> polylineAfter) call(
      MoveAndSplitPolylineUseCaseParams params) {
    List<LatLng> polylinePoints = params.polylinePoints;
    double distance = params.distance;
    double accumulatedDistance = 0.0;

    for (int i = 0; i < polylinePoints.length - 1; i++) {
      LatLng start = polylinePoints[i];
      LatLng end = polylinePoints[i + 1];

      double segmentDistance = _distanceBetween(start, end);

      if (accumulatedDistance + segmentDistance >= distance) {
        double remainingDistance = distance - accumulatedDistance;
        double fraction = remainingDistance / segmentDistance;
        LatLng currentPosition = interpolate(start, end, fraction);

        // Разделение Polyline на две части
        List<LatLng> polylineBefore = polylinePoints.sublist(0, i + 1);
        polylineBefore.add(currentPosition);

        List<LatLng> polylineAfter = [currentPosition];
        polylineAfter.addAll(polylinePoints.sublist(i + 1));

        return (
          currentPosition,
          polylineBefore,
          polylineAfter,
        );
      }

      accumulatedDistance += segmentDistance;
    }

    // Если distance превышает общую длину Polyline, возвращаем последнюю точку и весь Polyline до нее
    return (
      polylinePoints.last,
      polylinePoints,
      [],
    );
  }

  // Функция для вычисления расстояния между двумя точками на сфере
  double _distanceBetween(LatLng point1, LatLng point2) {
    const double earthRadius = 6371000; // Радиус Земли в метрах

    double dLat = _degreesToRadians(point2.latitude - point1.latitude);
    double dLon = _degreesToRadians(point2.longitude - point1.longitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(point1.latitude)) *
            cos(_degreesToRadians(point2.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

// Перевод градусов в радианы
  double _degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

// Функция для вычисления новой координаты на основе начальной точки, конечной точки и доли пройденного пути
  LatLng interpolate(LatLng start, LatLng end, double fraction) {
    double lat = start.latitude + (end.latitude - start.latitude) * fraction;
    double lon = start.longitude + (end.longitude - start.longitude) * fraction;
    return LatLng(lat, lon);
  }
}

class MoveAndSplitPolylineUseCaseParams {
  final List<LatLng> polylinePoints;
  final double distance;

  MoveAndSplitPolylineUseCaseParams({
    required this.polylinePoints,
    required this.distance,
  });
}
