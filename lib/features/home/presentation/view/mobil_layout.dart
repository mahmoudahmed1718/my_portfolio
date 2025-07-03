import 'package:flutter/material.dart';
import 'package:portfolio/core/helper/show_more_option.dart';
import 'package:portfolio/core/widgets/mobil_bottom_nav.dart';
import 'package:portfolio/features/home/presentation/view/mobil_projects.dart';
import 'package:portfolio/features/home/presentation/view/mobil_snippets.dart';
import 'package:portfolio/features/home/presentation/view/widgets/mobil_layout_body.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final GlobalKey homeKey = GlobalKey();
  int currentIndex = 0;
  late ScrollController _scrollController;
  bool isNavBarVisible = true;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 100 && isNavBarVisible) {
        setState(() {
          isNavBarVisible = false;
        });
      } else if (_scrollController.position.pixels <= 100 && !isNavBarVisible) {
        setState(() {
          isNavBarVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MobileBottomNav(
        isNavBarVisible: isNavBarVisible,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            scrollToSection(homeKey);
          } else if (index == 1) {
            Navigator.pushNamed(context, MobileProjects.routeName);
          } else if (index == 2) {
            Navigator.pushNamed(context, MobileSnippets.routeName);
          } else if (index == 3) {
            showMoreOptions(context);
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
      body: MobileLayoutBody(
        homeKey: homeKey,
        scrollController: _scrollController,
      ),
    );
  }
}
