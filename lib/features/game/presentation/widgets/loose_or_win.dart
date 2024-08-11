import 'package:flutter/material.dart';
import 'package:food_driver/features/game/domain/entities/loose_win_entity.dart';
import 'package:food_driver/features/game/presentation/widgets/loose_game.dart';
import 'package:food_driver/features/game/presentation/widgets/win_game.dart';

class LooseOrWin extends StatelessWidget {
  final LooseWinEntity looseWin;

  const LooseOrWin({
    super.key,
    required this.looseWin,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.black26),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: looseWin.progress == null
              ? WinGame(reward: looseWin.reward)
              : LooseGame(
                  totalTime: looseWin.totalTime,
                  progress: looseWin.progress,
                ),
        ),
      ),
    );
  }
}
