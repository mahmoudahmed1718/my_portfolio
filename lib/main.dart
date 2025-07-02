import 'package:flutter/material.dart';
import 'package:portfolio/core/helper/on_generate_route.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/features/home/presentation/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahmoud Ahmed | Software Engineer | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
      ),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: HomeView.routeName,
    );
  }
}
