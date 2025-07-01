import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

class BiographyText extends StatelessWidget {
  const BiographyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SelectableText(
          'Biography',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 8),
        SelectableText.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 16,
              color: AppColors.secondaryText,
              height: 1.5,
            ),
            children: [
              TextSpan(
                text:
                    'Flutter enthusiast learning to build adaptive applications with ',
              ),
              TextSpan(
                text: 'clean architecture. ',
                style: TextStyle(color: AppColors.blueDark),
              ),
              TextSpan(
                text:
                    'I enjoy writing clean code, exploring best practices, and collaborating in team environments. Passionate about ',
              ),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(color: AppColors.accentBlue),
              ),
              TextSpan(text: ', '),
              TextSpan(
                text: 'UI/UX',
                style: TextStyle(color: AppColors.accent),
              ),
              TextSpan(text: ', and continuous learning across platforms.'),
            ],
          ),
        ),
      ],
    );
  }
}
