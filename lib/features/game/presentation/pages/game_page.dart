import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/core/services/geolocation/geolocation_service.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/domain/entities/loose_win_entity.dart';
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
import 'package:food_driver/generated/locale_keys.g.dart';
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
          noCity: (noCity) {
            return Scaffold(
              body: _NoCity(determineLocation: tryGetCity),
            );
          },
          initialized: (initialized) {
            return _InitializedGameState(
              routes: initialized.routes,
              markers: initialized.markers,
              cameraPosition: initialized.cameraPosition,
              toggleToPlay: toggleToPlay,
              openRatingList: openRatingList,
              balance: initialized.balance,
            );
          },
          game: (game) {
            return _GameState(
              status: game.status,
              markers: game.markers,
              polylineAfter: game.polylineAfter,
              polylines: game.polylines,
              gameRoute: game.gameRoute,
              cameraPosition: game.cameraPosition,
              toggleToInit: toggleToInit,
              toggleToPlay: toggleToPlay,
              breakGame: breakGame,
              openRatingList: openRatingList,
              onTap: onTap,
              looseWin: game.looseWin,
              userId: widget.user.id,
              balance: game.balance,
              speed: game.speed,
              seconds: game.dseconds ~/ 10,
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
        fit: StackFit.expand,
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
  final CameraPosition cameraPosition;
  final VoidCallback toggleToPlay;
  final VoidCallback openRatingList;
  final num? balance;

  const _InitializedGameState({
    super.key,
    required this.routes,
    required this.markers,
    required this.cameraPosition,
    required this.toggleToPlay,
    required this.openRatingList,
    required this.balance,
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
              balance: balance,
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

class _NoCity extends StatelessWidget {
  const _NoCity({required this.determineLocation});

  final VoidCallback determineLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: determineLocation,
            child: Text(LocaleKeys.gamePageDetermineTheLocation.tr()),
          ),
        ),
      ),
    );
  }
}

class _GameState extends StatelessWidget {
  final GameStateType status;
  final Set<Marker> markers;
  final Polyline? polylineAfter;
  final Set<Polyline> polylines;
  final DriveRouteEntity gameRoute;
  final CameraPosition cameraPosition;
  final VoidCallback toggleToInit;
  final VoidCallback toggleToPlay;
  final VoidCallback breakGame;
  final VoidCallback openRatingList;
  final VoidCallback onTap;
  final LooseWinEntity? looseWin;
  final int userId;
  final num? balance;
  final num? speed;
  final int seconds;

  const _GameState({
    super.key,
    required this.status,
    required this.markers,
    required this.polylineAfter,
    required this.polylines,
    required this.gameRoute,
    required this.cameraPosition,
    required this.toggleToInit,
    required this.toggleToPlay,
    required this.breakGame,
    required this.openRatingList,
    required this.onTap,
    required this.looseWin,
    required this.userId,
    required this.balance,
    required this.speed,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topLeft,
        children: [
          Game(
            type: status,
            markers: markers,
            polylines: polylineAfter == null ? polylines : {polylineAfter!},
            reward: gameRoute.reward,
            cameraPosition: cameraPosition,
          ),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Navigation(
              key: ValueKey(status),
              type: status,
              toggleToInit: toggleToInit,
              toggleToPlay: toggleToPlay,
              breakGame: breakGame,
              balance: balance,
              speed: speed,
              seconds: seconds,
              openRatingList: openRatingList,
            ),
          ),
          if (status == GameStateType.playing ||
              status == GameStateType.starting)
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Center(
                child: MultiTapButton(
                  callback: status == GameStateType.starting ? null : onTap,
                ),
              ),
            ),
          if (appFlavor == 'dev' &&
              (status == GameStateType.playing ||
                  status == GameStateType.starting))
            Positioned(
              top: 185.0,
              left: 0,
              right: 0,
              child: GameDebug(
                userId: userId.toString(),
                routeId: gameRoute.id.toString(),
              ),
            ),
          if ((status == GameStateType.loose || status == GameStateType.win) &&
              looseWin != null)
            LooseOrWin(
              looseWin: looseWin!,
              breakGame: breakGame,
            ),
        ],
      ),
    );
  }
}
