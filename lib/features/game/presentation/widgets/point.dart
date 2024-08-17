import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class Point {
  static final Point _singleton = Point._internal();
  factory Point() => _singleton;
  Point._internal();

  static OverlayState? _overlayState;
  bool _isVisible = false;

  DateTime lastTime = DateTime.now();

  late OverlayEntry _overlayEntry;

  void showOverlay(
    BuildContext context, {
    required Offset position,
    required Size screenSize,
    required double buttonSize,
  }) {
    if (_isVisible) {
      _overlayEntry.remove();
      _isVisible = false;
    }
    _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: (screenSize.width - buttonSize) / 2 + position.dx,
          top: screenSize.height - 10 - buttonSize + position.dy,
          bottom: 0,
          child: const Material(
            color: Colors.transparent,
            child: Text(
              "+1",
              style: TextStyle(
                fontSize: 24,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
    _overlayState?.insert(_overlayEntry);
    _isVisible = true;
    lastTime = DateTime.now();
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      final timeDifference = DateTime.now().difference(lastTime).inMilliseconds;
      if (_isVisible && timeDifference > (99)) {
        _overlayEntry.remove();
        _isVisible = false;
      }
    });
  }
}
