import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/fdc_formatter.dart';
import 'package:food_driver/core/extensions/time_formatter.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class RoutePainter extends CustomPainter {
  RoutePainter({
    this.reward,
    this.seconds,
  });

  final num? reward;
  final int? seconds;

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(63.0, 47.0);
    path_0.lineTo(61, 50.0);
    path_0.lineTo(59.0, 47.0);
    path_0.cubicTo(58.0, 45.0, 56.0, 44, 54.0, 44);
    path_0.lineTo(50, 44);
    path_0.cubicTo(45.0, 44, 41, 40.0, 41, 35);
    path_0.lineTo(41, 14);
    path_0.cubicTo(41, 9.0, 45.0, 5, 50, 5);
    path_0.lineTo(72, 5);
    path_0.cubicTo(77.0, 5, 81, 9.0, 81, 14);
    path_0.lineTo(81, 35);
    path_0.cubicTo(81, 40.0, 77.0, 44, 72, 44);
    path_0.lineTo(68.0, 44);
    path_0.cubicTo(66.0, 44, 64.0, 45.0, 63.0, 47.0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffB31E21).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffB31E21).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(const Rect.fromLTWH(5, 0, 101, 44),
            bottomRight: const Radius.circular(9.0),
            bottomLeft: const Radius.circular(9.0),
            topLeft: const Radius.circular(9.0),
            topRight: const Radius.circular(9.0)),
        paint1Fill);

    var darkRedCircle = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;
    var redCircle = Paint()
      ..color = AppColors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(22.0, 22.0), 10, darkRedCircle);
    canvas.drawCircle(const Offset(22.0, 22.0), 8, redCircle);

    // paint reward
    const textStyle = TextStyle(
      color: AppColors.white,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );
    var textSpan = TextSpan(
      text: reward?.fdc ?? '',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    const offset = Offset(38, 8);
    textPainter.paint(canvas, offset);

    Path path_5 = Path();
    path_5.moveTo(48.1667, 26.75);
    path_5.cubicTo(48.1667, 26.4278, 48.4278, 26.1666, 48.75, 26.1666);
    path_5.lineTo(52.25, 26.1666);
    path_5.cubicTo(52.5722, 26.1666, 52.8333, 26.4278, 52.8333, 26.75);
    path_5.cubicTo(52.8333, 27.0721, 52.5722, 27.3333, 52.25, 27.3333);
    path_5.lineTo(51.0833, 27.3333);
    path_5.lineTo(51.0833, 28.5);
    path_5.cubicTo(51.0833, 28.512, 51.083, 28.524, 51.0822, 28.5359);
    path_5.cubicTo(51.9347, 28.642, 52.7159, 28.9781, 53.3616, 29.48);
    path_5.lineTo(54.1708, 28.6708);
    path_5.cubicTo(54.3987, 28.443, 54.768, 28.443, 54.9958, 28.6708);
    path_5.cubicTo(55.2236, 28.8986, 55.2236, 29.268, 54.9958, 29.4958);
    path_5.lineTo(54.1866, 30.305);
    path_5.cubicTo(54.8009, 31.0952, 55.1667, 32.0882, 55.1667, 33.1666);
    path_5.cubicTo(55.1667, 35.744, 53.0773, 37.8333, 50.5, 37.8333);
    path_5.cubicTo(47.9227, 37.8333, 45.8333, 35.744, 45.8333, 33.1666);
    path_5.cubicTo(45.8333, 30.7865, 47.6152, 28.8225, 49.9178, 28.5359);
    path_5.cubicTo(49.917, 28.524, 49.9167, 28.512, 49.9167, 28.5);
    path_5.lineTo(49.9167, 27.3333);
    path_5.lineTo(48.75, 27.3333);
    path_5.cubicTo(48.4278, 27.3333, 48.1667, 27.0721, 48.1667, 26.75);
    path_5.close();
    path_5.moveTo(50.5, 29.6666);
    path_5.cubicTo(48.567, 29.6666, 47, 31.2336, 47, 33.1666);
    path_5.cubicTo(47, 35.0996, 48.567, 36.6666, 50.5, 36.6666);
    path_5.cubicTo(52.433, 36.6666, 54, 35.0996, 54, 33.1666);
    path_5.cubicTo(54, 31.2336, 52.433, 29.6666, 50.5, 29.6666);
    path_5.close();
    path_5.moveTo(50.5, 30.8333);
    path_5.cubicTo(50.8222, 30.8333, 51.0833, 31.0945, 51.0833, 31.4166);
    path_5.lineTo(51.0833, 33.1666);
    path_5.cubicTo(51.0833, 33.4888, 50.8222, 33.75, 50.5, 33.75);
    path_5.cubicTo(50.1778, 33.75, 49.9167, 33.4888, 49.9167, 33.1666);
    path_5.lineTo(49.9167, 31.4166);
    path_5.cubicTo(49.9167, 31.0945, 50.1778, 30.8333, 50.5, 30.8333);
    path_5.close();

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_5, paint5Fill);

    // paint seconds
    const textStyle1 = TextStyle(
      color: AppColors.white,
      fontSize: 11,
      fontWeight: FontWeight.w500,
    );
    var textSpan1 = TextSpan(
      text: TimeFormatter.formatDuration(seconds ?? 0),
      style: textStyle1,
    );
    final textPainter1 = TextPainter(
      text: textSpan1,
      textDirection: TextDirection.ltr,
    );
    textPainter1.layout();

    const offset1 = Offset(58, 26.75);
    textPainter1.paint(canvas, offset1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
