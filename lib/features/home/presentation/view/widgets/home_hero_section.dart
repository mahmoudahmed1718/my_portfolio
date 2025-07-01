import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/view/widgets/gradient_text.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: GradientText(
            'Hi I\'m Mahmoud Ahmed, a special human '
            'with some ability to love learning '
            'and working on teamwork.',
            gradient: const LinearGradient(
              colors: [Color(0xFF3BF686), Color(0xFF4CA9FF)],
            ),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
