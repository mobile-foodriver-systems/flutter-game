import 'package:flutter/material.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/presentation/widgets/game.dart';
import 'package:food_driver/features/game/presentation/widgets/help_game_message.dart';
import 'package:food_driver/features/game/presentation/widgets/navigation.dart';
import 'package:food_driver/features/game/presentation/widgets/tap_button.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  GameStateType type = GameStateType.init;

  final ValueNotifier<num> speed = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topLeft,
        children: [
          Game(
            type: type,
            toggleToInit: toggleToInit,
          ),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Navigation(
              key: ValueKey(type),
              type: type,
              toggleToInit: toggleToInit,
              toggleToPlay: toggleToPlay,
              breakGame: breakGame,
              balance: 17.04,
              speed: 1,
            ),
          ),
          if (type == GameStateType.playing || type == GameStateType.starting)
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
          if (type == GameStateType.init)
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

  void toggleToInit() {
    setState(() {
      type = GameStateType.init;
    });
  }

  void toggleToPlay() {
    setState(() {
      type = GameStateType.playing;
    });
  }

  void breakGame() {}

  void onTap() {
    if (type != GameStateType.playing) {
      return;
    }
  }
}
