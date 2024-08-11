import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/presentation/bloc/game/game_bloc.dart';
import 'package:food_driver/features/game/presentation/pages/error_page.dart';
import 'package:food_driver/features/game/presentation/pages/raiting_list_page.dart';
import 'package:food_driver/features/game/presentation/widgets/game.dart';
import 'package:food_driver/features/game/presentation/widgets/help_game_message.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/features/game/presentation/widgets/loose_or_win.dart';
import 'package:food_driver/features/game/presentation/widgets/navigation.dart';
import 'package:food_driver/features/game/presentation/widgets/tap_button.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/data/models/country.dart';
import 'package:food_driver/features/location/presentation/pages/city_list_page.dart';
import 'package:food_driver/features/location/presentation/pages/country_list_page.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/presentation/bloc/user_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'package:food_driver/features/game/presentation/pages/mixins/game_mixin.dart';

class GamePage extends StatelessWidget {
  final UserEntity user;

  const GamePage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GameBloc>(),
      child: GamePageBody(user: user),
    );
  }
}

class GamePageBody extends StatefulWidget {
  final UserEntity user;
  const GamePageBody({
    super.key,
    required this.user,
  });

  @override
  State<GamePageBody> createState() => _GamePageBodyState();
}

class _GamePageBodyState extends State<GamePageBody> with GameMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (BuildContext context, GameState state) {
        if (state.status == GameStateType.error) {
          return const ErrorPage();
        }
        return Scaffold(
          body: state.status == GameStateType.loading
              ? const LoadingIndicator()
              : Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.topLeft,
                  children: [
                    Game(
                      type: state.status,
                      //toggleToInit: toggleToInit,
                      routes: state.routes,
                      markers: state.markers,
                      polylines: state.polylines,
                      reward: state.gameRoute?.reward,
                      determineLocation: tryGetCity,
                    ),
                    if ((state.status == GameStateType.loose ||
                            state.status == GameStateType.win) &&
                        state.looseWin != null)
                      LooseOrWin(looseWin: state.looseWin!),
                    Positioned(
                      top: 16,
                      left: 0,
                      right: 0,
                      child: Navigation(
                        key: ValueKey(state.status),
                        type: state.status,
                        toggleToInit: toggleToInit,
                        toggleToPlay: toggleToPlay,
                        breakGame: breakGame,
                        // TODO: set variable
                        balance: 0.0,
                        speed: state.speed,
                        seconds: state.seconds,
                        openRaitingList: openRaitingList,
                      ),
                    ),
                    if (state.status == GameStateType.playing ||
                        state.status == GameStateType.starting)
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Center(
                          child: TapButton(
                            callback: onTap,
                          ),
                        ),
                      ),
                    if (state.status == GameStateType.initialized)
                      const Positioned(
                        bottom: 16.0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: HelpGameMessage(),
                        ),
                      ),
                  ],
                ),
        );
      },
    );
  }
}
