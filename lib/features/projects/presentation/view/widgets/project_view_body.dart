import 'package:flutter/material.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/core/widgets/custom_footer.dart';
import 'package:portfolio/core/widgets/custom_header.dart';
import 'package:portfolio/features/about_me/presentation/view/about_me_view.dart';
import 'package:portfolio/features/contact_section.dart/presentation/view/contact_view.dart';
import 'package:portfolio/features/home/presentation/view/mobil_projects.dart';
import 'package:portfolio/features/projects/presentation/view/widgets/all_project_layout.dart';
import 'package:portfolio/features/projects/presentation/view/widgets/project_text.dart';
import 'package:portfolio/features/snippets/presentation/view/snippet_code_view.dart';

class ProjectsViewBody extends StatefulWidget {
  const ProjectsViewBody({super.key});

  @override
  State<ProjectsViewBody> createState() => _ProjectsViewBodyState();
}

class _ProjectsViewBodyState extends State<ProjectsViewBody> {
  String selectedItem = 'Portfolio';

  void onNavItemClick(String section) {
    setState(() => selectedItem = section);

    if (section == 'What I Do') {
      Navigator.pushNamed(context, AboutMeView.routeName);
    } else if (section == 'Snippets') {
      Navigator.pushNamed(context, SnippetCodeView.routeName);
    } else if (section == 'Contact') {
      Navigator.pushNamed(context, ContactView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constrains) => constrains.maxWidth < 800
          ? MobileProjects() // MobileProjects()
          : buildProjectsDesktopLayout(width),
    );
  }

  SingleChildScrollView buildProjectsDesktopLayout(double width) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              onNavItemClick: onNavItemClick,
              selectedItem: selectedItem,
            ),
            const Divider(color: AppColors.normalText),
            const SizedBox(height: 72),
            Row(
              children: [
                ProjectText(),
                SizedBox(width: width * 0.050224966),
                Image.asset(
                  Assets.imagesProjectArrow2,
                  width: width * 0.1163684559,
                ),
              ],
            ),
            const SizedBox(height: 82),
            AllProjectsLayout(),
            const SizedBox(height: 82),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
