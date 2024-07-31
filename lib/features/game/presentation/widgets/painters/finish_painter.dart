import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class FinishPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var circle = Paint()
      ..color = AppColors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(27.5, 27.5), 24.5, circle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
