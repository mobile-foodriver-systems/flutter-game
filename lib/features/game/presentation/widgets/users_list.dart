import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/core/ui/view/bi_directional_scroll_view.dart';
import 'package:food_driver/features/game/data/models/user_rating.dart';
import 'package:food_driver/features/game/presentation/bloc/rating/rating_bloc.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';
import 'package:food_driver/features/location/presentation/widgets/interactive_list.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

part 'package:food_driver/features/game/presentation/pages/mixins/rating_mixin.dart';

class UsersList extends StatefulWidget {
  const UsersList({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> with RatingMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
      builder: (BuildContext context, RatingState state) {
        return Column(
          children: [
            const _RatingListHeader(),
            Expanded(
              child: InteractiveList<Selectable>(
                status: state.status,
                error: state.error,
                list: state.ratingList?.list ?? [],
                listView: BiDirectionalScrollView(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) => buildListItem(
                    context,
                    index,
                    state,
                  ),
                  controller: _scrollController,
                  itemCount: state.ratingList?.list.length ?? 0,
                  centerItemPosition: getCenterItemPosition(state),
                  onLoadMore: _onLoadMore,
                ),
              ),
            ),
            _RatingUserWidget(position: state.position),
          ],
        );
      },
    );
  }

  int getCenterItemPosition(RatingState state) {
    var centerIndex = state.ratingList?.list.indexWhere(
      (element) => element.id == widget.userId,
    );
    if (centerIndex == -1) return 0;
    return centerIndex ?? 0;
  }

  Widget buildListItem(BuildContext context, int index, RatingState state) {
    var rating = state.ratingList!.list[index];
    return _UserRatingItem(
      rating: rating,
      isActive: rating.id == widget.userId,
    );
  }
}

class _UserRatingItem extends StatelessWidget {
  const _UserRatingItem({
    required this.rating,
    this.isActive = false,
    this.decoration = const BoxDecoration(
      color: AppColors.textFieldGray,
    ),
  });

  final UserRating rating;
  final bool isActive;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.red : AppColors.black,
        );
    return DecoratedBox(
      decoration: decoration,
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

class _RatingListHeader extends StatelessWidget {
  const _RatingListHeader({super.key});

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

class _RatingUserWidget extends StatelessWidget {
  final UserRating? position;

  const _RatingUserWidget({
    super.key,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    if (position != null) {
      return _UserRatingItem(
        rating: position!,
        isActive: true,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.red),
          color: AppColors.textFieldGray,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(13),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
