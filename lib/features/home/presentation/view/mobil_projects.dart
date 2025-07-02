import 'package:flutter/material.dart';
import 'package:portfolio/core/helper/all_projects_list.dart';
import 'package:portfolio/core/helper/show_more_option.dart';
import 'package:portfolio/core/widgets/custom_footer.dart';
import 'package:portfolio/core/widgets/mobil_bottom_nav.dart';
import 'package:portfolio/features/home/presentation/view/mobil_snippets.dart';
import 'package:portfolio/features/home/presentation/view/widgets/project_card.dart';
import 'package:portfolio/features/projects/presentation/view/widgets/project_text.dart';

class MobileProjects extends StatefulWidget {
  static const String routeName = 'mobile-projects';
  const MobileProjects({super.key});

  @override
  State<MobileProjects> createState() => _MobileProjectsState();
}

class _MobileProjectsState extends State<MobileProjects> {
  int currentIndex = 1;
  final GlobalKey portfolioKey = GlobalKey();
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
            scrollToSection(portfolioKey);
          } else if (index == 0) {
            Navigator.pop(context);
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

      body: MobileProjectsBody(
        key: portfolioKey,
        scrollController: _scrollController,
      ),
    );
  }
}

class MobileProjectsBody extends StatelessWidget {
  const MobileProjectsBody({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 28),
            FittedBox(fit: BoxFit.scaleDown, child: const ProjectText()),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            const MobileAllProjects(),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}

class MobileAllProjects extends StatelessWidget {
  const MobileAllProjects({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allProjects.length,
      itemBuilder: (context, index) {
        final project = allProjects[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ProjectCard(
            imagePath: project.imagePath,
            type: project.type,
            title: project.title,
            description: project.description,
            url: project.url,
          ),
        );
      },
    );
  }
}
