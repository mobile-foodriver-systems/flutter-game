import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/user_rating.dart';
import 'package:food_driver/generated/l10n.dart';

class UsersList extends StatelessWidget {
  static const List<UserRating> list = [
    UserRating(name: "test1", position: 1),
    UserRating(name: "test2", position: 2),
    UserRating(name: "test3", position: 3),
    UserRating(name: "test4", position: 4),
    UserRating(name: "test5", position: 5),
    UserRating(name: "test6", position: 6),
    UserRating(name: "test7", position: 7),
    UserRating(name: "test8", position: 8),
  ];

  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _RaitingListHeader(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _UserRatingItem(rating: list[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 4.0);
            },
            itemCount: list.length,
          ),
        ),
      ],
    );
  }
}

class _UserRatingItem extends StatelessWidget {
  const _UserRatingItem({
    super.key,
    required this.rating,
  });

  final UserRating rating;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.textFieldGray),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                rating.name ?? S.current.progressListPageUnknown,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12.0),
            Text(
              rating.position.toString(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
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
              S.current.progressListPageNick,
              style: textStyle,
            ),
            Text(
              S.current.progressListPageScore,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
