import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class InteractiveList<T extends Selectable> extends StatelessWidget {
  const InteractiveList({
    super.key,
    required this.status,
    required this.listView,
    required this.list,
    this.error,
  });

  final ListStatus status;
  final Widget listView;

  final List<T> list;
  final Failure? error;

  @override
  Widget build(BuildContext context) {
    const TextStyle errorTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.red,
    );
    switch (status) {
      case ListStatus.loading:
        if (list.isEmpty) {
          return const LoadingIndicator();
        }
        return listView;
      case ListStatus.success:
        if (list.isEmpty) {
          return Center(
            child: Text(
              LocaleKeys.listPageEmptyList.tr(),
              style: errorTextStyle,
            ),
          );
        }
        return listView;
      case ListStatus.error:
        return _ListError(
          error: error,
          style: errorTextStyle,
        );
      case ListStatus.initial:
        return const LoadingIndicator();
    }
  }
}

class _ListError extends StatelessWidget {
  const _ListError({
    this.error,
    this.style,
  });

  final Failure? error;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.time_to_leave,
          size: MediaQuery.sizeOf(context).width * 0.4,
          color: AppColors.red,
        ),
        Text(
          error?.message ?? LocaleKeys.gamePageSomethingWrong.tr(),
          style: style,
        ),
      ],
    );
  }
}
