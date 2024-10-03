import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/services/geolocation/geolocation_service.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
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
        return state.map(
          error: (error) {
            return const ErrorPage();
          },
          loading: (loading) {
            return const _LoadingGameState();
          },
          initialized: (initialized) {
            return _InitializedGameState(
              routes: initialized.routes,
              markers: initialized.markers,
              determineLocation: tryGetCity,
              cameraPosition: initialized.cameraPosition,
              toggleToPlay: toggleToPlay,
              openRatingList: openRatingList,
            );
          },
          game: (game) {
            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topLeft,
                children: [
                  Game(
                    type: game.status,
                    markers: game.markers,
                    polylines: game.polylineAfter == null
                        ? game.polylines
                        : {game.polylineAfter!},
                    reward: game.gameRoute?.reward,
                    determineLocation: tryGetCity,
                    cameraPosition: game.cameraPosition,
                  ),
                  Positioned(
                    top: 16,
                    left: 0,
                    right: 0,
                    child: Navigation(
                      key: ValueKey(game.status),
                      type: game.status,
                      toggleToInit: toggleToInit,
                      toggleToPlay: toggleToPlay,
                      breakGame: breakGame,
                      balance: game.balance ?? widget.user.balance,
                      speed: game.speed,
                      seconds: game.dseconds ~/ 10,
                      openRatingList: openRatingList,
                    ),
                  ),
                  if (game.status == GameStateType.playing ||
                      game.status == GameStateType.starting)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: Center(
                        child: MultiTapButton(
                          callback: game.status == GameStateType.starting
                              ? null
                              : onTap,
                        ),
                      ),
                    ),
                  if (appFlavor == 'dev' &&
                      (game.status == GameStateType.playing ||
                          game.status == GameStateType.starting))
                    Positioned(
                      top: 185.0,
                      left: 0,
                      right: 0,
                      child: GameDebug(
                        userId: widget.user.id.toString(),
                        routeId: game.gameRoute?.id.toString(),
                      ),
                    ),
                  if ((game.status == GameStateType.loose ||
                          game.status == GameStateType.win) &&
                      game.looseWin != null)
                    LooseOrWin(
                      looseWin: game.looseWin!,
                      breakGame: breakGame,
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _LoadingGameState extends StatelessWidget {
  const _LoadingGameState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          CustomLoadingIndiacator(),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Navigation(type: GameStateType.loading),
          ),
        ],
      ),
    );
  }
}

class _InitializedGameState extends StatelessWidget {
  final List<DriveRouteEntity> routes;
  final Set<Marker> markers;
  final VoidCallback determineLocation;
  final CameraPosition cameraPosition;
  final VoidCallback toggleToPlay;
  final VoidCallback openRatingList;

  const _InitializedGameState({
    super.key,
    required this.routes,
    required this.markers,
    required this.determineLocation,
    required this.cameraPosition,
    required this.toggleToPlay,
    required this.openRatingList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topLeft,
        children: [
          Game(
            type: GameStateType.initialized,
            routes: routes,
            markers: markers,
            determineLocation: determineLocation,
            cameraPosition: cameraPosition,
          ),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Navigation(
              type: GameStateType.initialized,
              toggleToPlay: toggleToPlay,
              openRatingList: openRatingList,
            ),
          ),
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
  }
}
