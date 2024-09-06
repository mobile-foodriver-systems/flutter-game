import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class DirectionIndicatorWidget extends StatefulWidget {
  final Offset center;
  final List<Offset> points;

  const DirectionIndicatorWidget({
    super.key,
    required this.center,
    required this.points,
  });

  @override
  _DirectionIndicatorWidgetState createState() => _DirectionIndicatorWidgetState();
}

class _DirectionIndicatorWidgetState extends State<DirectionIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: DirectionPainter(
            center: widget.center,
            points: widget.points,
            animationValue: _controller.value,
          ),
        );
      },
    );
  }
}

enum _Directional {
  left,
  right,
  top,
  bottom;
}

class DirectionPainter extends CustomPainter {
  final Offset center;
  final List<Offset> points;
  final double animationValue;
  // final Size widgetSize;

  DirectionPainter({
    required this.center,
    required this.points,
    required this.animationValue,
    // required this.widgetSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.red.withOpacity(animationValue)
      ..style = PaintingStyle.fill;

    final borderPoints = points.map((point) {
      // Вычисляем угол направления от центра к точке
      final angle = atan2(point.dy - center.dy, point.dx - center.dx);

      // Определяем точку на границе виджета
      return _getIntersectionPoint(size, angle);
    });

    var groupedBorderPoints = <(Offset, _Directional, int)>[];
    for (var borderPoint in borderPoints) {
      var existGroupIndex = groupedBorderPoints.indexWhere(
          (element) => element.$2 == borderPoint.$2 && (element.$1 - borderPoint.$1).distance < 40);
      if (existGroupIndex == -1) {
        groupedBorderPoints.add((borderPoint.$1, borderPoint.$2, 1));
      } else {
        var existGroup = groupedBorderPoints[existGroupIndex];
        groupedBorderPoints[existGroupIndex] = (
          _calculatGroupCenter([existGroup.$1, borderPoint.$1]),
          existGroup.$2,
          existGroup.$3 + 1,
        );
      }
      // Рисуем стрелку с использованием Path
    }

    for (var groupedBorderPoint in groupedBorderPoints) {
      _drawArrow(
        canvas,
        paint,
        groupedBorderPoint.$1,
        groupedBorderPoint.$2,
        groupedBorderPoint.$3,
      );
    }
  }

  Offset _calculatGroupCenter(List<Offset> group) {
    double sumX = 0;
    double sumY = 0;
    for (Offset point in group) {
      sumX += point.dx;
      sumY += point.dy;
    }
    return Offset(sumX / group.length, sumY / group.length);
  }

  // Функция нахождения точки пересечения
  (Offset, _Directional) _getIntersectionPoint(Size size, double angle) {
    final double dx = cos(angle);
    final double dy = sin(angle);
    const padding = 0.0;

    // Прямоугольник с отступом
    const double left = padding;
    final double right = size.width - padding;
    const double top = padding;
    final double bottom = size.height - padding;

    // Центр прямоугольника
    final Offset center = Offset(size.width / 2, size.height / 2);

    var hDirectional = _Directional.left;
    var vDirectional = _Directional.left;

    // Переменные для пересечений
    double tX, tY;

    // Рассчитываем пересечение с вертикальными границами (лево/право)
    if (dx > 0) {
      // Пересечение с правой границей
      tX = (right - center.dx) / dx;
      hDirectional = _Directional.right;
    } else {
      // Пересечение с левой границей
      tX = (left - center.dx) / dx;
      hDirectional = _Directional.left;
    }

    // Рассчитываем пересечение с горизонтальными границами (верх/низ)
    if (dy > 0) {
      // Пересечение с нижней границей
      tY = (bottom - center.dy) / dy;
      vDirectional = _Directional.bottom;
    } else {
      // Пересечение с верхней границей
      tY = (top - center.dy) / dy;
      vDirectional = _Directional.top;
    }

    // Находим минимальное значение t (где пересечение происходит раньше)
    double tMin = min(tX, tY);
    _Directional directional;
    if (tX < tY) {
      directional = hDirectional;
    } else {
      directional = vDirectional;
    }

    // Вычисляем координаты пересечения
    final double x = center.dx + tMin * dx;
    final double y = center.dy + tMin * dy;

    return (Offset(x, y), directional);
  }

  // Метод для рисования стрелки
  void _drawArrow(Canvas canvas, Paint paint, Offset point, _Directional directional, int count) {
    // Сохраняем текущее состояние canvas
    canvas.save();

    final angle = switch (directional) {
      _Directional.left => 0.0,
      _Directional.right => pi,
      _Directional.bottom => -pi / 2,
      _Directional.top => pi / 2,
    };

    point = switch (directional) {
      _Directional.left => point + const Offset(33, 0),
      _Directional.right => point + const Offset(-33, 0),
      _Directional.bottom => point + const Offset(0, -33),
      _Directional.top => point + const Offset(0, 33),
    };

    Path arrowPath = Path()
      ..moveTo(-21.41395, -2.386)
      ..lineTo(-25.00046, 0)
      ..lineTo(-21.41395, 2.386)
      ..cubicTo(-19.74196, 3.4983, -18.7373, 5.3733, -18.7373, 7.3815)
      ..lineTo(-18.7373, 11)
      ..cubicTo(-18.7373, 16.9706, -14.7079, 21, -9.7373, 21)
      ..lineTo(11.2627, 21)
      ..cubicTo(16.2333, 21, 20.2627, 16.9706, 20.2627, 11)
      ..lineTo(20.2627, -11)
      ..cubicTo(20.2627, -16.9706, 16.2333, -21, 11.2627, -21)
      ..lineTo(-9.7373, -21)
      ..cubicTo(-14.7079, -21, -18.7373, -16.9706, -18.7373, -11)
      ..lineTo(-18.7373, -8.3815)
      ..cubicTo(-18.7373, -6.3733, -19.74196, -4.4983, -21.41395, -2.386)
      ..close();

    arrowPath = rotatePath(arrowPath, angle);

    // Перемещаем canvas в точку, где будем рисовать стрелку
    canvas.translate(point.dx, point.dy);

    // Рисуем стрелку
    canvas.drawPath(arrowPath, paint);

    // Восстанавливаем состояние canvas
    canvas.restore(); // Сохраняем текущее состояние canvas
    canvas.save();

    // Перемещаем canvas в точку, где будем рисовать стрелку
    canvas.translate(point.dx, point.dy);

    TextPainter textPainter = TextPainter(
      text: TextSpan(text: '$count', style: const TextStyle(color: Colors.white, fontSize: 16)),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      switch (directional) {
        _Directional.left => Offset(-textPainter.width / 2, -textPainter.height / 2),
        _Directional.right => Offset(-textPainter.width / 2, -textPainter.height / 2),
        _Directional.bottom => Offset(-textPainter.width / 2, -textPainter.height / 2),
        _Directional.top => Offset(-textPainter.width / 2, -textPainter.height / 2),
      },
    );

    // Восстанавливаем состояние canvas
    canvas.restore();
  }

  Path rotatePath(Path path, double angle) {
    // Создаем матрицу для преобразований
    final Matrix4 matrix = Matrix4.identity();

    // Шаг 2: Повернуть path на заданный угол (в радианах)
    matrix.rotateZ(angle);

    // Применяем матрицу к Path
    return path.transform(matrix.storage);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
