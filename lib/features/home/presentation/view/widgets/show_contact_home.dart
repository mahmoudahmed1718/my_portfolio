import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

import 'package:url_launcher/url_launcher.dart';

class ShowContactInHome extends StatelessWidget {
  const ShowContactInHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            launchUrl(Uri.parse('mailto:abdelrahmankhaleddev@gmail.com'));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SelectableText(
              'Say Hello',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            onPressed: () {
              // GoRouter.of(context).push(AppRouter.kContact);
            },
            icon: Icon(Icons.menu),
            label: Text('See More'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.background,
              foregroundColor: AppColors.white,
              side: const BorderSide(color: AppColors.secondaryText),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
