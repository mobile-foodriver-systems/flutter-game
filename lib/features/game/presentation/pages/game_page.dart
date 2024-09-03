import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/services/geolocation/geolocation_service.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/presentation/bloc/game/game_bloc.dart';
import 'package:food_driver/features/game/presentation/pages/error_page.dart';
import 'package:food_driver/features/game/presentation/pages/rating_list_page.dart';
import 'package:food_driver/features/game/presentation/widgets/custom_loading_indicator.dart';
import 'package:food_driver/features/game/presentation/widgets/game.dart';
import 'package:food_driver/features/game/presentation/widgets/game_debug.dart';
import 'package:food_driver/features/game/presentation/widgets/help_game_message.dart';
import 'package:food_driver/features/game/presentation/widgets/loose_or_win.dart';
import 'package:food_driver/features/game/presentation/widgets/multi_tap_button.dart';
import 'package:food_driver/features/game/presentation/widgets/navigation.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/location/data/models/country.dart';
import 'package:food_driver/features/location/presentation/pages/city_list_page.dart';
import 'package:food_driver/features/location/presentation/pages/country_list_page.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'package:food_driver/features/game/presentation/pages/mixins/game_mixin.dart';

class GamePage extends StatelessWidget {
  final UserEntity user;

  const GamePage({
    super.key,
    required this.user,
  });

  static MaterialPageRoute route({required UserEntity user}) =>
      MaterialPageRoute(
        builder: (context) => GamePage(user: user),
      );

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
          body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topLeft,
            children: [
              if (state.status == GameStateType.loading)
                const CustomLoadingIndiacator()
              else
                Game(
                  type: state.status,
                  routes: state.routes,
                  markers: state.markers,
                  polylines: state.polylineAfter == null
                      ? state.polylines
                      : {state.polylineAfter!},
                  reward: state.gameRoute?.reward,
                  determineLocation: tryGetCity,
                  cameraPosition: state.cameraPosition,
                ),
              if ((state.status == GameStateType.loose ||
                      state.status == GameStateType.win) &&
                  state.looseWin != null)
                LooseOrWin(
                  looseWin: state.looseWin!,
                  breakGame: breakGame,
                ),
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
                  balance: state.balance ?? widget.user.balance,
                  speed: state.speed,
                  seconds: state.dseconds ~/ 10,
                  openRatingList: openRatingList,
                ),
              ),
              if (state.status == GameStateType.playing ||
                  state.status == GameStateType.starting)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: Center(
                    child: MultiTapButton(
                      callback:
                          state.status == GameStateType.starting ? null : onTap,
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
              if (appFlavor == 'dev' &&
                  (state.status == GameStateType.playing ||
                      state.status == GameStateType.starting))
                Positioned(
                  top: 185.0,
                  left: 0,
                  right: 0,
                  child: GameDebug(
                    userId: widget.user.id.toString(),
                    routeId: state.gameRoute?.id.toString(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
