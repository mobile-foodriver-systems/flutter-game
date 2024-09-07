import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 44.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            LocaleKeys.profilePageDeleteAccountConfirm.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(LocaleKeys.profilePageYes.tr()),
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(LocaleKeys.profilePageNo.tr()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
