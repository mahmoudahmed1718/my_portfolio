import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/assets.dart';

import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String imagePath;
  final String type;
  final String title;
  final String description;
  final String url;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.type,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.backgroundCards,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            right: 12,
            child: IconButton(
              onPressed: () {
                launchUrl(Uri.parse(url));
              },
              icon: Image.asset(Assets.imagesProjectArrow),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  type,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                SelectableText(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
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
                  maxLines: 5,
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 320,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
