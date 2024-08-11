import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/data/models/game_state_type.dart';
import 'package:food_driver/features/game/presentation/widgets/balance.dart';
import 'package:food_driver/features/game/presentation/widgets/countdown_text.dart';
import 'package:food_driver/features/game/presentation/widgets/game_progress.dart';
import 'package:food_driver/features/user/presentation/pages/profile_page.dart';
import 'package:food_driver/features/user/presentation/widgets/close_icon_button.dart';
import 'package:food_driver/features/user/presentation/widgets/progress_icon_button.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    super.key,
    this.type = GameStateType.initialized,
    this.balance,
    this.speed,
    required this.toggleToInit,
    required this.toggleToPlay,
    required this.breakGame,
    required this.openRaitingList,
    this.seconds = 0,
  });

  final GameStateType type;
  final num? balance;
  final VoidCallback toggleToInit;
  final VoidCallback toggleToPlay;
  final VoidCallback breakGame;
  final VoidCallback openRaitingList;
  final num? speed;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.buttonShadow,
                    offset: Offset(0, 6),
                    blurRadius: 16.0,
                  ),
                ],
              ),
              child: type == GameStateType.starting
                  ? CountdownText(
                      seconds: 3,
                      callback: toggleToPlay,
                    )
                  : type == GameStateType.playing
                      ? GameProgress(
                          speed: speed,
                          seconds: seconds,
                        )
                      : Balance(
                          callback: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage())),
                          balance: balance,
                        ),
            ),
            type == GameStateType.initialized
                ? ProgressIconButton(onPressed: openRaitingList)
                : CloseIconButton(onPressed: onPressed),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    if (type == GameStateType.starting ||
        type == GameStateType.win ||
        type == GameStateType.loose) {
      toggleToInit();
    } else if (type == GameStateType.playing) {
      breakGame();
    }
  }
}
