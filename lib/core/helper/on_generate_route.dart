import 'package:flutter/material.dart';
import 'package:portfolio/features/about_me/presentation/view/about_me_view.dart';
import 'package:portfolio/features/home/presentation/view/home_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AboutMeView.routeName:
      return MaterialPageRoute(builder: (context) => const AboutMeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
