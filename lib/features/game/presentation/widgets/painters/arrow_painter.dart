import 'dart:math';

import 'package:flutter/material.dart';

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
      ..color = Colors.red.withOpacity(animationValue)
      ..style = PaintingStyle.fill;

    for (var point in points) {
      // Вычисляем угол направления от центра к точке
      final angle = atan2(point.dy - center.dy, point.dx - center.dx);

      // Определяем точку на границе виджета
      Offset borderPoint = _getIntersectionPoint(size, angle);
      // Рисуем мигающий индикатор на границе
      canvas.drawCircle(borderPoint, 10.0, paint);
    }
  }

  // Offset _getPointOnBorder(Size size, double angle) {
  //   final radius = min(size.width, size.height) / 2;
  //   return Offset(
  //     radius * cos(angle) + size.width / 2,
  //     radius * sin(angle) + size.height / 2,
  //   );
  // }

  // Функция нахождения точки пересечения
  Offset _getIntersectionPoint(Size size, double angle) {
    final double dx = cos(angle);
    final double dy = sin(angle);
    const padding = 10.0;

    // Прямоугольник с отступом
    const double left = padding;
    final double right = size.width - padding;
    const double top = padding;
    final double bottom = size.height - padding;

    // Центр прямоугольника
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Переменные для пересечений
    double tX, tY;

    // Рассчитываем пересечение с вертикальными границами (лево/право)
    if (dx > 0) {
      // Пересечение с правой границей
      tX = (right - center.dx) / dx;
    } else {
      // Пересечение с левой границей
      tX = (left - center.dx) / dx;
    }

    // Рассчитываем пересечение с горизонтальными границами (верх/низ)
    if (dy > 0) {
      // Пересечение с нижней границей
      tY = (bottom - center.dy) / dy;
    } else {
      // Пересечение с верхней границей
      tY = (top - center.dy) / dy;
    }

    // Находим минимальное значение t (где пересечение происходит раньше)
    double tMin = min(tX, tY);

    // Вычисляем координаты пересечения
    final double x = center.dx + tMin * dx;
    final double y = center.dy + tMin * dy;

    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
