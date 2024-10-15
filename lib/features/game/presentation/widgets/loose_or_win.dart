import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_driver/features/game/domain/entities/loose_win_entity.dart';
import 'package:food_driver/features/game/presentation/widgets/loose_game.dart';
import 'package:food_driver/features/game/presentation/widgets/win_game.dart';

class LooseOrWin extends StatefulWidget {
  final LooseWinEntity looseWin;
  final VoidCallback breakGame;

  const LooseOrWin({
    super.key,
    required this.looseWin,
    required this.breakGame,
  });

  @override
  State<LooseOrWin> createState() => _LooseOrWinState();
}

class _LooseOrWinState extends State<LooseOrWin> {
  bool isActive = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      isActive = true;
      setState(() {});
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: isActive ? widget.breakGame : null,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black26),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: widget.looseWin.progress == null
                ? WinGame(
                    reward: widget.looseWin.reward,
                    breakGame: widget.breakGame,
                  )
                : LooseGame(
                    totalTime: widget.looseWin.totalTime,
                    progress: widget.looseWin.progress,
                    breakGame: widget.breakGame,
                  ),
          ),
        ),
      ),
    );
  }
}
