import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/location/presentation/widgets/custom_radio_button.dart';

class ListItem<T extends Selectable> extends StatelessWidget {
  const ListItem({
    super.key,
    required this.select,
    required this.item,
    required this.isActive,
  });

  final void Function(T) select;
  final T item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => select(item),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CustomRadioButton(isActive: isActive),
            ),
            Flexible(
              child: Text(
                item.name ?? "",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: isActive ? AppColors.red : AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
