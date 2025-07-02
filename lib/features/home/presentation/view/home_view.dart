import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/view/mobil_layout.dart';
import 'package:portfolio/features/home/presentation/view/tablet_and_desktop_layout.dart';
import 'package:portfolio/features/home/presentation/view/widgets/adaptive_layout.dart';

class HomeView extends StatelessWidget {
  static const routeName = 'home_view';
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (BuildContext context) => const MobileLayout(),
      tabletLayout: (BuildContext context) => const TabletAndDesktopLayout(),
      desktopLayout: (BuildContext context) => const TabletAndDesktopLayout(),
    );
  }
}
