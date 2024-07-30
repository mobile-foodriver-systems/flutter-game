import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(63.386, 46.6766);
    path_0.lineTo(61, 50.2632);
    path_0.lineTo(58.614, 46.6766);
    path_0.cubicTo(57.5017, 45.0047, 55.6267, 44, 53.6185, 44);
    path_0.lineTo(50, 44);
    path_0.cubicTo(45.0294, 44, 41, 39.9706, 41, 35);
    path_0.lineTo(41, 14);
    path_0.cubicTo(41, 9.02944, 45.0294, 5, 50, 5);
    path_0.lineTo(72, 5);
    path_0.cubicTo(76.9706, 5, 81, 9.02944, 81, 14);
    path_0.lineTo(81, 35);
    path_0.cubicTo(81, 39.9706, 76.9706, 44, 72, 44);
    path_0.lineTo(68.3815, 44);
    path_0.cubicTo(66.3733, 44, 64.4983, 45.0047, 63.386, 46.6766);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffB31E21).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffB31E21).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.04508197, 0, size.width * 0.9098361,
                size.height * 0.8627451),
            bottomRight: Radius.circular(size.width * 0.07377049),
            bottomLeft: Radius.circular(size.width * 0.07377049),
            topLeft: Radius.circular(size.width * 0.07377049),
            topRight: Radius.circular(size.width * 0.07377049)),
        paint1Fill);

    Path path_3 = Path();
    path_3.moveTo(17.5, 22);
    path_3.cubicTo(17.5, 27.5228, 21.9772, 32, 27.5, 32);
    path_3.cubicTo(33.0228, 32, 37.5, 27.5228, 37.5, 22);
    path_3.cubicTo(37.5, 16.4772, 33.0228, 12, 27.5, 12);
    path_3.cubicTo(21.9772, 12, 17.5, 16.4772, 17.5, 22);
    path_3.close();
    path_3.moveTo(35.1, 22);
    path_3.cubicTo(35.1, 26.1974, 31.6974, 29.6, 27.5, 29.6);
    path_3.cubicTo(23.3026, 29.6, 19.9, 26.1974, 19.9, 22);
    path_3.cubicTo(19.9, 17.8026, 23.3026, 14.4, 27.5, 14.4);
    path_3.cubicTo(31.6974, 14.4, 35.1, 17.8026, 35.1, 22);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    paint3Stroke.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    canvas.drawPath(path_3, paint3Fill);

    // TODO: paint reward
    Path path_4 = Path();
    path_4.moveTo(48.1683, 19.1939);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

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

    // TODO: paint seconds
    Path path_6 = Path();
    path_6.moveTo(63.0547, 36.1328);
    path_6.close();

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_6, paint6Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
