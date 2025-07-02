import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_text_styles.dart';

class ProjectText extends StatelessWidget {
  const ProjectText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SelectableText('Project that i', style: AppTextStyles.bold56),
        Row(
          children: [
            SelectableText('has been', style: AppTextStyles.bold56),
            const SizedBox(width: 8),
            SelectableText(
              'done',
              style: AppTextStyles.bold56.copyWith(color: AppColors.accent),
            ),
          ],
        ),
      ],
    );
  }
}
