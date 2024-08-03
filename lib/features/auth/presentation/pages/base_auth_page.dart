import 'package:flutter/material.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';

class BaseAuthPage extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const BaseAuthPage({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: scaffoldDecoration,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: child,
                  ),
                ),
              ),
            ),
            if (isLoading)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.5),
                ),
                child: const LoadingIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
