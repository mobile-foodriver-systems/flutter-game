import 'package:flutter/material.dart';
import 'package:food_driver/constants/config.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.url,
  });

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: _launchUrl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(
                text,
                style: const TextStyle(color: AppColors.black),
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: AppColors.arrowRightGray,
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    final uri = Uri.tryParse(Config.privacyPolicy);
    if (uri == null) return;
    launchUrl(uri);
  }
}
