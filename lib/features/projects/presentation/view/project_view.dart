import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/presentation/view/widgets/project_view_body.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});
  static const routeName = 'projects';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProjectsViewBody());
  }
}
