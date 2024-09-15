import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/game/data/models/user_sort_type.dart';
import 'package:food_driver/features/game/presentation/bloc/rating/rating_bloc.dart';
import 'package:food_driver/features/game/presentation/pages/mixins/location_mixin.dart';
import 'package:food_driver/features/game/presentation/widgets/custom_segmented_button.dart';
import 'package:food_driver/features/game/presentation/widgets/users_list.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/user/presentation/widgets/close_icon_button.dart';
import 'package:food_driver/generated/locale_keys.g.dart';

class RatingListPage extends StatefulWidget {
  final int userId;

  const RatingListPage({
    super.key,
    required this.userId,
  });

  @override
  State<RatingListPage> createState() => _RatingListPageState();
}

class _RatingListPageState extends State<RatingListPage> with LocationMixin {
  City? userCity;

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
                  child: BlocProvider(
                    create: (_) => getIt<RatingBloc>(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          LocaleKeys.progressListPageRatingOfParticipants.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<RatingBloc, RatingState>(
                          builder: (BuildContext context, RatingState state) {
                            final bloc = context.read<RatingBloc>();
                            return CustomSegmentedButton(
                              value: state.sort,
                              separator: const SizedBox(width: 4.0),
                              onChanged: (sort) => onChanged(sort, bloc),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: UsersList(userId: widget.userId),
                          ),
                        ),
                      ],
                    ),
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

  Future<void> onChanged(UsersSortType sort, RatingBloc bloc) async {
    bloc.add(RatingReloadEvent(sort: sort));
    if (sort == UsersSortType.distance && userCity == null) {
      userCity = await tryGetCity();
      setState(() {});
    }
    bloc.add(RatingReloadEvent(
      sort: sort,
      city: userCity,
    ));
  }
}
