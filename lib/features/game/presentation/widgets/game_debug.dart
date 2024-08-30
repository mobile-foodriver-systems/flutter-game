import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class GameDebug extends StatelessWidget {
  final String? userId;
  final String? routeId;

  const GameDebug({
    super.key,
    this.userId,
    this.routeId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "userId: = $userId\nrouteId: = $routeId",
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }
}
