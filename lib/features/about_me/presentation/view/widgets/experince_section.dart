import 'package:flutter/material.dart';
import 'package:portfolio/features/about_me/presentation/view/widgets/experince_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experience",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),

          ExperienceItem(
            role: "Flutter Developer",
            company: "Khadmaty ",
            date: "Nov 2024 – Present",
            description:
                "Contributed to building LMS and attendance platforms in an EdTech startup. "
                "Worked on authentication, real-time dashboards, and user management using "
                "Flutter, Firebase, and Cubit with a clean architecture approach.",
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
