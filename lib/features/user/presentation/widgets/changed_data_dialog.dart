import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class ChangedDataDialog extends StatelessWidget {
  final VoidCallback dataChanged;
  const ChangedDataDialog({
    super.key,
    required this.dataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightGreen,
          ),
          child: Image.asset(AssetsCatalog.icCheck),
        ),
        const SizedBox(height: 20.0),
        Text(
          LocaleKeys.profilePageDataChanged.tr(),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            dataChanged();
          },
          child: Text(
            LocaleKeys.profilePageOk.tr(),
          ),
        ),
      ],
    );
  }
}
