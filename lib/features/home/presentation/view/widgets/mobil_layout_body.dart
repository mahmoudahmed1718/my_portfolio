import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/custom_footer.dart';
import 'package:portfolio/features/home/presentation/view/widgets/biography_text.dart';
import 'package:portfolio/features/home/presentation/view/widgets/connection_icons.dart';
import 'package:portfolio/features/home/presentation/view/widgets/gradient_text.dart';
import 'package:portfolio/features/home/presentation/view/widgets/home_profile.dart';
import 'package:portfolio/features/home/presentation/view/widgets/service_card.dart';
import 'package:portfolio/features/home/presentation/view/widgets/what_i_do_text.dart';

class MobileLayoutBody extends StatelessWidget {
  const MobileLayoutBody({
    super.key,
    required this.homeKey,
    required this.scrollController,
  });

  final GlobalKey homeKey;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 37),
            Container(key: homeKey, child: const HomeProfile()),
            const SizedBox(height: 22),
            const ConnectionIcons(),
            const SizedBox(height: 38),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: GradientText(
                'Hi, I’m Mahmoud Ahmed — a passionate Flutter developer who loves continuous learning and collaborating in team environments.',
                gradient: const LinearGradient(
                  colors: [Color(0xFF3BF686), Color(0xFF4CA9FF)],
                ),
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const BiographyText(),
            const SizedBox(height: 14),
            const WhatIDoText(),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8569545155,
              child: const Row(
                children: [
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.flutter_dash,
                      title: 'Flutter Development',
                      description:
                          'I build high-performance, responsive, and visually appealing mobile and web apps with Flutter.',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.design_services,
                      title: 'UI/UX in Flutter',
                      description:
                          'I design intuitive, user-friendly Flutter interfaces following best practices and modern design principles.',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
