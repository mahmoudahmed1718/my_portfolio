import 'package:flutter/material.dart';
import 'package:portfolio/core/helper/all_projects_list.dart';
import 'package:portfolio/features/home/presentation/view/widgets/project_card.dart';

class AllProjectsLayout extends StatelessWidget {
  const AllProjectsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: GridView.builder(
          itemCount: allProjects.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 32,
            mainAxisSpacing: 42,
          ),
          itemBuilder: (context, index) {
            final project = allProjects[index];
            return SizedBox(
              width: 350,
              height: 300,
              child: ProjectCard(
                imagePath: project.imagePath,
                type: project.type,
                title: project.title,
                description: project.description,
                url: project.url,
              ),
            );
          },
        ),
      ),
    );
  }
}
