import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/user_rating.dart';
import 'package:food_driver/features/game/presentation/bloc/raiting/raiting_bloc.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/location/presentation/widgets/interactive_list.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

part 'package:food_driver/features/game/presentation/pages/mixins/raiting_mixin.dart';

class UsersList extends StatefulWidget {
  const UsersList({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> with RaitingMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _RaitingListHeader(),
        BlocBuilder<RaitingBloc, RaitingState>(
          builder: (BuildContext context, RaitingState state) {
            return Expanded(
              child: InteractiveList<Selectable>(
                status: state.status,
                error: state.error,
                list: state.raitingList?.list ?? [],
                listView: ListView.separated(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _UserRatingItem(
                      rating: state.raitingList!.list[index],
                      isActive:
                          state.raitingList!.list[index].id == widget.userId,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4.0);
                  },
                  itemCount: state.raitingList?.list.length ?? 0,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _UserRatingItem extends StatelessWidget {
  const _UserRatingItem({
    required this.rating,
    this.isActive = false,
  });

  final UserRating rating;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.red : AppColors.black,
        );
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.textFieldGray),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                rating.userName ?? LocaleKeys.progressListPageUnknown.tr(),
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12.0),
            Text(
              rating.balanceInFDT.toString(),
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _RaitingListHeader extends StatelessWidget {
  const _RaitingListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        );
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.red),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.progressListPageNick.tr(),
              style: textStyle,
            ),
            Text(
              LocaleKeys.progressListPageScore.tr(),
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
