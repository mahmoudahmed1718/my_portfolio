import 'package:flutter/material.dart';
import 'package:portfolio/features/about_me/presentation/view/about_me_view.dart';
import 'package:portfolio/features/contact_section.dart/presentation/view/contact_view.dart';
import 'package:portfolio/features/home/presentation/view/home_view.dart';
import 'package:portfolio/features/home/presentation/view/mobil_projects.dart';
import 'package:portfolio/features/home/presentation/view/mobil_snippets.dart';
import 'package:portfolio/features/projects/presentation/view/project_view.dart';
import 'package:portfolio/features/snippets/presentation/view/snippet_code_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AboutMeView.routeName:
      return MaterialPageRoute(builder: (context) => const AboutMeView());
    case ContactView.routeName:
      return MaterialPageRoute(builder: (context) => const ContactView());
    case ProjectsView.routeName:
      return MaterialPageRoute(builder: (context) => const ProjectsView());
    case SnippetCodeView.routeName:
      return MaterialPageRoute(builder: (context) => const SnippetCodeView());
    case MobileSnippets.routeName:
      return MaterialPageRoute(builder: (context) => const MobileSnippets());
    case MobileProjects.routeName:
      return MaterialPageRoute(builder: (context) => const MobileProjects());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
