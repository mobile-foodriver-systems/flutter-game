import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';

class TournamentNamedValue extends StatelessWidget {
  final String title;
  final String value;
  const TournamentNamedValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.red,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
