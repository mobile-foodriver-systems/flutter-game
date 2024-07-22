import 'package:flutter/material.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/features/game/data/models/user_sort_type.dart';
import 'package:food_driver/features/game/presentation/widgets/custom_segmented_button.dart';
import 'package:food_driver/features/game/presentation/widgets/users_list.dart';
import 'package:food_driver/features/profile/presentation/widgets/close_icon_button.dart';

class ProgressListPage extends StatefulWidget {
  const ProgressListPage({super.key});

  @override
  State<ProgressListPage> createState() => _ProgressListPageState();
}

class _ProgressListPageState extends State<ProgressListPage> {
  var sortType = UsersSortType.global;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: scaffoldDecoration,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CloseIconButton(
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Рейтинг участников",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      CustomSegmentedButton(
                        value: sortType,
                        separator: const SizedBox(width: 4.0),
                        onChanged: (value) {
                          sortType = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: const UsersList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }
}
