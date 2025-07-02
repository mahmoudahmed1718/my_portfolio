import 'package:flutter/material.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/core/helper/show_more_option.dart';
import 'package:portfolio/core/widgets/mobil_bottom_nav.dart';
import 'package:portfolio/features/contact_section.dart/presentation/view/widgets/contact_section.dart';
import 'package:portfolio/features/home/presentation/view/home_view.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});
  static const String routeName = 'contact';
  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  int currentIndex = 3;
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: screenWidth > 800
          ? null
          : MobileBottomNav(
              isNavBarVisible: isNavBarVisible,
              currentIndex: currentIndex,
              onTap: (index) {
                if (index == 0) {
                  Navigator.pushNamed(context, HomeView.routeName);
                } else if (index == 1) {
                  // GoRouter.of(context).push(AppRouter.kMobileProjects);
                } else if (index == 2) {
                  // GoRouter.of(context).push(AppRouter.kMobileSnippets);
                } else if (index == 3) {
                  showMoreOptions(context);
                } else {
                  setState(() {
                    currentIndex = index;
                  });
                }
              },
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 800
                ? 24
                : screenWidth * horizontalPadding,
          ),
          child: ContactSection(),
        ),
      ),
    );
  }
}
