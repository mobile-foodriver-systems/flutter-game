import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class DriverPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var darkRedCircle = Paint()
      ..color = AppColors.markerDarkRed
      ..style = PaintingStyle.fill;
    var redCircle = Paint()
      ..color = AppColors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(27.5, 27.5), 27.5, darkRedCircle);
    canvas.drawCircle(const Offset(27.5, 27.5), 24.5, redCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
