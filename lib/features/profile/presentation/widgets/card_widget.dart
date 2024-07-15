import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
    this.margin = const EdgeInsets.only(right: 4.0),
    this.alignment,
  });

  final Widget? child;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
