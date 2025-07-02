import 'package:flutter/material.dart';

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

          _ExperienceItem(
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

class _ExperienceItem extends StatelessWidget {
  final String role;
  final String company;
  final String date;
  final String description;

  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        if (isMobile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                role,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(company, style: TextStyle(color: Colors.grey[500])),
              Text(date, style: TextStyle(color: Colors.grey[500])),
              const SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(color: Colors.grey[500], height: 1.5),
              ),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(company, style: TextStyle(color: Colors.grey[500])),
                    Text(date, style: TextStyle(color: Colors.grey[500])),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(color: Colors.grey[500], height: 1.5),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
