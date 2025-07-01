import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/features/home/presentation/view/widgets/biography_text.dart';
import 'package:portfolio/features/home/presentation/view/widgets/connection_section.dart';
import 'package:portfolio/features/home/presentation/view/widgets/home_profile.dart';

class HomeBiographySection extends StatelessWidget {
  const HomeBiographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 850;

        return Container(
          color: AppColors.background,
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(alignment: Alignment.center, child: HomeProfile()),
                    const SizedBox(height: 24),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.34,
                      child: const BiographyText(),
                    ),

                    const SizedBox(height: 24),

                    const ConnectSection(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: AppColors.accent,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: AppColors.accentBlue,
                        child: Image.asset(Assets.imagesImageProfile),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.022),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.34,
                      child: const BiographyText(),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.057),
                    const ConnectSection(),
                  ],
                ),
        );
      },
    );
  }
}
