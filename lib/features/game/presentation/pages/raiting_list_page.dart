import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/game/presentation/bloc/raiting/raiting_bloc.dart';
import 'package:food_driver/features/game/presentation/widgets/custom_segmented_button.dart';
import 'package:food_driver/features/game/presentation/widgets/users_list.dart';
import 'package:food_driver/features/user/presentation/widgets/close_icon_button.dart';
import 'package:food_driver/generated/l10n.dart';

class RaitingListPage extends StatelessWidget {
  const RaitingListPage({super.key});

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
                    create: (_) => getIt<RaitingBloc>(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          S.current.progressListPageRatingOfParticipants,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<RaitingBloc, RaitingState>(
                          builder: (BuildContext context, RaitingState state) {
                            return CustomSegmentedButton(
                              value: state.sort,
                              separator: const SizedBox(width: 4.0),
                              onChanged: (sort) {
                                context
                                    .read<RaitingBloc>()
                                    .add(RaitingLoadEvent(sort: sort));
                              },
                            );
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
              ),
              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }
}
