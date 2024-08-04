import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/raiting_state_type.dart';
import 'package:food_driver/features/game/data/models/user_rating.dart';
import 'package:food_driver/features/game/presentation/bloc/raiting/raiting_bloc.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/generated/l10n.dart';

part 'package:food_driver/features/game/presentation/pages/mixins/raiting_mixin.dart';

class UsersList extends StatefulWidget {
  const UsersList({
    super.key,
  });

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> with RaitingMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RaitingBloc, RaitingState>(
      builder: (BuildContext context, RaitingState state) {
        return Column(
          children: [
            const _RaitingListHeader(),
            if (state.status == RaitingStateType.loading)
              const LoadingIndicator()
            else if (state.status == RaitingStateType.success)
              Expanded(
                child: ListView.separated(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _UserRatingItem(
                        rating: state.raitingList!.list[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4.0);
                  },
                  itemCount: state.raitingList!.list.length,
                ),
              ),
          ],
        );
      },
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
                rating.userName ?? S.current.progressListPageUnknown,
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
              rating.balanceInFDT.toString(),
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
