import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/helper/url_lanucher_function.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_text_styles.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: AppColors.normalText),
        const SizedBox(height: 16),
        const Text(
          "Designed & Developed with ❤️ by Mahmoud Ahmed",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 32),
        const SelectableText('Reach me out', style: AppTextStyles.semibold14),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                lunchCustomUrl('https://github.com/mahmoudahmed1718');
              },
              icon: const Icon(
                FontAwesomeIcons.github,
                size: 20,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                lunchCustomUrl(
                  'https://www.linkedin.com/in/mahmoud-ahmed-hassan-8091b8283/',
                );
              },
              icon: const Icon(
                FontAwesomeIcons.linkedin,
                size: 20,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                lunchCustomUrl(
                  'https://www.instagram.com/mo.hassan.tv?igsh=MWRoc3VyczBnb3E5cw==',
                );
              },
              icon: const Icon(
                FontAwesomeIcons.instagram,
                size: 20,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
