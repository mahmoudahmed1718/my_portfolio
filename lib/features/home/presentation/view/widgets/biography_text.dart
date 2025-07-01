import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

class BiographyText extends StatelessWidget {
  const BiographyText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          'Biography',
          style: textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 8),
        SelectableText.rich(
          TextSpan(
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.secondaryText,
              height: 1.5,
            ),
            children: const [
              TextSpan(
                text:
                    'Passionate Flutter developer specializing in adaptive, clean-architecture applications. ',
              ),
              TextSpan(
                text:
                    'I enjoy writing maintainable code, applying best practices, and collaborating in team environments. ',
              ),
              TextSpan(
                text:
                    'Dedicated to Flutter, UI/UX excellence, and continuous cross-platform learning.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
