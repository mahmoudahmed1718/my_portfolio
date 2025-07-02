import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_text_styles.dart';

class SnippetsHeaderSection extends StatelessWidget {
  const SnippetsHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText('Code Snippets', style: AppTextStyles.bold48),
        SizedBox(height: 45),
        SelectableText('Search code snippet', style: AppTextStyles.bold18),
        SizedBox(height: 20),
      ],
    );
  }
}
