import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/user_sort_type.dart';

class CustomSegmentedButton extends StatelessWidget {
  const CustomSegmentedButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.separator,
  });

  final UsersSortType value;
  final void Function(UsersSortType value) onChanged;
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    final buttons = UsersSortType.values.map((sortType) {
      if (sortType == value) {
        return Expanded(
          child: _ActiveSegmentedButton(type: sortType),
        );
      }
      return Expanded(
        child: _InactiveSegmentedButton(
          type: sortType,
          onChanged: onChanged,
        ),
      );
    }).toList();
    var separatedButtons = <Widget>[];
    if (separator == null) {
      separatedButtons = buttons;
    } else {
      buttons.forEachIndexed((index, child) {
        if (index != UsersSortType.values.length - 1) {
          separatedButtons.add(child);
          separatedButtons.add(separator!);
        } else {
          separatedButtons.add(child);
        }
      });
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.textFieldGray,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: separatedButtons,
        ),
      ),
    );
  }
}

class _ActiveSegmentedButton extends StatelessWidget {
  const _ActiveSegmentedButton({
    super.key,
    required this.type,
  });

  final UsersSortType type;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          type.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _InactiveSegmentedButton extends StatelessWidget {
  const _InactiveSegmentedButton({
    super.key,
    required this.type,
    required this.onChanged,
  });

  final UsersSortType type;
  final void Function(UsersSortType value) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(type),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          type.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.segmentedTextGray,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
