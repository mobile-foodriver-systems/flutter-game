import 'package:flutter/material.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/location/presentation/widgets/search_text_field.dart';
import 'package:food_driver/generated/l10n.dart';

class BaseLocationPage<T extends Selectable> extends StatelessWidget {
  const BaseLocationPage({
    super.key,
    required this.unfocusSearchField,
    required this.selectText,
    required this.searchFieldLable,
    required this.value,
    required this.search,
    required this.clear,
    required this.child,
  });

  final VoidCallback unfocusSearchField;
  final String selectText;
  final String searchFieldLable;
  final T? value;
  final void Function(String)? search;
  final VoidCallback clear;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusSearchField,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              selectText,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 20),
            SearchTextField(
              key: ObjectKey(value),
              value: value,
              label: searchFieldLable,
              search: search,
              clear: clear,
            ),
            const SizedBox(height: 20),
            Expanded(child: child),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(value),
              child: Text(S.current.countryListPageDone),
            ),
          ],
        ),
      ),
    );
  }
}
