import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/features/about_me/presentation/view/about_me_view.dart';
import 'package:portfolio/features/home/presentation/view/widgets/service_card.dart';
import 'package:portfolio/features/home/presentation/view/widgets/what_i_do_text.dart';

class HomeWhatIDoSection extends StatelessWidget {
  const HomeWhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 850;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.31,
                        child: WhatIDoText(),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.018),

                    Expanded(
                      flex: 3,
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: [
                          const ServiceCard(
                            icon: Icons.flutter_dash,
                            title: 'Flutter Development',
                            description:
                                'I build fast, responsive, and beautiful mobile & web apps using Flutter.',
                          ),
                          const ServiceCard(
                            icon: Icons.design_services,
                            title: 'UI/UX in Flutter',
                            description:
                                'I focus on creating smooth and user-friendly designs with Flutter best practices.',
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 80),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AboutMeView.routeName,
                                );
                              },
                              icon: Image.asset(Assets.imagesWhatIDoArrow),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SelectableText(
                      'What I do',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const SelectableText.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.secondaryText,
                          height: 1.6,
                        ),
                        children: [
                          TextSpan(
                            text: 'Build and maintain applications using ',
                          ),
                          TextSpan(
                            text: 'Flutter',
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                          TextSpan(
                            text:
                                ', focusing on UI/UX and performance. Also mentoring at ',
                          ),
                          TextSpan(
                            text: 'MOFON',
                            style: TextStyle(color: AppColors.accent),
                          ),
                          TextSpan(
                            text:
                                '. I value clean code, teamwork, and continuous learning.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        const ServiceCard(
                          icon: Icons.flutter_dash,
                          title: 'Flutter Development',
                          description:
                              'I build fast, responsive, and beautiful mobile & web apps using Flutter.',
                        ),
                        const ServiceCard(
                          icon: Icons.design_services,
                          title: 'UI/UX in Flutter',
                          description:
                              'I focus on creating smooth and user-friendly designs with Flutter best practices.',
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 80),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AboutMeView.routeName,
                              );
                            },
                            icon: Image.asset(Assets.imagesWhatIDoArrow),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
