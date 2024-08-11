import 'package:flutter/material.dart';
import 'package:food_driver/features/game/presentation/widgets/loose_game.dart';
import 'package:food_driver/features/game/presentation/widgets/win_game.dart';

class LooseOrWin extends StatelessWidget {
  final num? balance;
  final int? totalTime;
  final num? progress;

  const LooseOrWin({
    super.key,
    this.balance,
    this.totalTime,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.black26),
      child: progress == null ? const WinGame() : const LooseGame(),
    );
  }
}
