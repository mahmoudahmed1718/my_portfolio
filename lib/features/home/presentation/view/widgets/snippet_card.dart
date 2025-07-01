import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

class SnippetCard extends StatelessWidget {
  final String title;
  final String description;
  final int stars;
  final List<IconData> icons;

  const SnippetCard({
    super.key,
    required this.title,
    required this.description,
    required this.stars,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.backgroundCards,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SelectableText(
              description,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                ...icons.map(
                  (icon) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(icon, color: AppColors.accent, size: 20),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                SelectableText(
                  '$stars Stars',
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
