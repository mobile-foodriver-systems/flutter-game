import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/features/game/presentation/widgets/rps_custom_painter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum MarkerType {
  route,
  driver,
  finish;

  CustomPaint get painter {
    switch (this) {
      case MarkerType.route:
        return CustomPaint(
          size: const Size(111, 51),
          painter: RPSCustomPainter(),
        );
      case MarkerType.driver:
        return CustomPaint(
          size: const Size(111, 51),
          painter: RPSCustomPainter(),
        );
      case MarkerType.finish:
        return CustomPaint(
          size: const Size(111, 51),
          painter: RPSCustomPainter(),
        );
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
