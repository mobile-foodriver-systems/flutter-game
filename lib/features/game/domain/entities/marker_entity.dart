import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/features/game/presentation/widgets/painters/driver_painter.dart';
import 'package:food_driver/features/game/presentation/widgets/painters/finish_painter.dart';
import 'package:food_driver/features/game/presentation/widgets/painters/route_painter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum MarkerType {
  route,
  driver,
  finish;

  CustomPaint painter({
    num? reward,
    int? seconds,
  }) {
    switch (this) {
      case MarkerType.route:
        return CustomPaint(
          size: const Size(111, 51),
          painter: RoutePainter(
            reward: reward,
            seconds: seconds,
          ),
        );
      case MarkerType.driver:
        return CustomPaint(
          size: const Size(55, 55),
          painter: DriverPainter(),
        );
      case MarkerType.finish:
        return CustomPaint(
          size: const Size(55, 55),
          painter: FinishPainter(),
        );
    }
  }

  CustomPaint staticPainter() {
    switch (this) {
      case MarkerType.route:
        return CustomPaint(
          size: const Size(111, 51),
          painter: RoutePainter(
            reward: 0,
            seconds: 0,
          ),
        );
      case MarkerType.driver:
        return CustomPaint(
          size: const Size(55, 55),
          painter: DriverPainter(),
        );
      case MarkerType.finish:
        return CustomPaint(
          size: const Size(55, 55),
          painter: FinishPainter(),
        );
    }
  }

  int get value {
    switch (this) {
      case MarkerType.route:
        return -3;
      case MarkerType.driver:
        return -1;
      case MarkerType.finish:
        return -2;
    }
  }
}

class MarkerEntity extends Equatable {
  final int markerId;
  final LatLng coordinate;
  final MarkerType markerType;
  final num? reward;
  final int? seconds;

  const MarkerEntity({
    required this.markerId,
    required this.coordinate,
    required this.markerType,
    this.reward,
    this.seconds,
  });

  @override
  List<Object?> get props => [
        markerId,
        coordinate,
        markerType,
        reward,
        seconds,
      ];
}
