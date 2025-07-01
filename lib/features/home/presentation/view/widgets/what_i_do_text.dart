import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

class WhatIDoText extends StatelessWidget {
  const WhatIDoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SelectableText(
          'What I do',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 12),
        SelectableText.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 16,
              color: AppColors.secondaryText,
              height: 1.6,
            ),
            children: [
              TextSpan(text: 'I build mobile and web applications using '),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(color: AppColors.accent),
              ),
              TextSpan(
                text:
                    ', with a focus on UI/UX, responsiveness, and performance. I\'m currently learning more about ',
              ),
              TextSpan(
                text: 'clean architecture',
                style: TextStyle(color: AppColors.blueDark),
              ),
              TextSpan(
                text:
                    ', state management, and API integration. I value clean code, collaboration, and continuous learning.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
