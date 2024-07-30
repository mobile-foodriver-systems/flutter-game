import 'package:flutter/material.dart';
import 'package:food_driver/core/extensions/fdt_formatter.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/domain/entities/drive_route_entity.dart';
import 'package:food_driver/features/game/presentation/widgets/game_map.dart';
import 'package:food_driver/generated/l10n.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Game extends StatelessWidget {
  const Game({
    super.key,
    required this.type,
    required this.toggleToInit,
    this.reward,
    this.routes = const [],
    this.markers = const <Marker>{},
    this.polylines = const <Polyline>{},
  });

  final GameStateType type;
  final num? reward;
  final VoidCallback toggleToInit;
  final List<DriveRouteEntity> routes;
  final Set<Marker> markers;
  final Set<Polyline> polylines;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case GameStateType.error:
      case GameStateType.loading:
        return const SizedBox();
      case GameStateType.initialized:
      case GameStateType.playing:
      case GameStateType.starting:
        return GameMap(
          routes: routes,
          markers: markers,
          polylines: polylines,
        );
      case GameStateType.win:
        return _WinGame(
          toggleToInit: toggleToInit,
          reward: reward,
        );
      case GameStateType.loose:
        return _LooseGame(toggleToInit: toggleToInit);
    }
  }
}

class _LooseGame extends StatelessWidget {
  const _LooseGame({
    super.key,
    required this.toggleToInit,
  });

  final VoidCallback toggleToInit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 352),
        Image.asset(AssetsCatalog.icFaceFrown),
        const SizedBox(height: 12.0),
        Text(
          S.current.gamePageLost,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.red),
        ),
        const Spacer(flex: 160),
        Center(
          child: SizedBox(
            width: 224.0,
            child: ElevatedButton(
              onPressed: toggleToInit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.textFieldGray,
                foregroundColor: AppColors.black,
              ),
              child: Text(S.current.gamePageTryAgain),
            ),
          ),
        ),
        const Spacer(flex: 140),
      ],
    );
  }
}

class _WinGame extends StatelessWidget {
  const _WinGame({
    super.key,
    required this.toggleToInit,
    this.reward,
  });

  final VoidCallback toggleToInit;
  final num? reward;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 367),
        Text(
          S.current.gamePageYourReward,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                "+ ${(reward ?? 0).fdt}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Image.asset(
              AssetsCatalog.roundedLogo,
              width: 40.0,
              height: 40.0,
            ),
          ],
        ),
        const Spacer(flex: 160),
        SizedBox(
          width: 162.0,
          child: ElevatedButton(
            onPressed: toggleToInit,
            child: Text(S.current.gamePagePlayMore),
          ),
        ),
        const Spacer(flex: 140),
      ],
    );
  }
}
