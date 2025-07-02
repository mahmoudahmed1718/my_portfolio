import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/core/helper/show_more_option.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_text_styles.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/core/widgets/custom_footer.dart';
import 'package:portfolio/core/widgets/custom_header.dart';
import 'package:portfolio/core/widgets/mobil_bottom_nav.dart';
import 'package:portfolio/features/about_me/presentation/view/widgets/experince_section.dart';
import 'package:portfolio/features/contact_section.dart/presentation/view/contact_view.dart';
import 'package:portfolio/features/home/presentation/view/home_view.dart';
import 'package:portfolio/features/home/presentation/view/mobil_projects.dart';
import 'package:portfolio/features/home/presentation/view/mobil_snippets.dart';
import 'package:portfolio/features/projects/presentation/view/project_view.dart';
import 'package:portfolio/features/snippets/presentation/view/snippet_code_view.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutMeView extends StatefulWidget {
  const AboutMeView({super.key});
  static const routeName = 'about-me';
  @override
  State<AboutMeView> createState() => _AboutMeViewState();
}

class _AboutMeViewState extends State<AboutMeView> {
  int currentIndex = 3;
  late ScrollController _scrollController;
  bool isNavBarVisible = true;

  @override
  void initState() {
    super.initState();
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
      bottomNavigationBar: MobileBottomNav(
        isNavBarVisible: isNavBarVisible,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, HomeView.routeName);
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
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * horizontalPadding,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            screenWidth < 800 ? const SizedBox() : _buildHeader(context),
            screenWidth < 800
                ? const SizedBox()
                : const Divider(color: AppColors.normalText),
            const SizedBox(height: 40),
            _buildBiographySection(context),
            const SizedBox(height: 40),
            const ExperienceSection(),

            const CustomFooter(),
          ],
        ),
      ),
    );
  }

  void onNavItemClick(BuildContext context, String item) {
    if (item == 'Portfolio') {
      Navigator.pushNamed(context, ProjectsView.routeName);
    } else if (item == 'Snippets') {
      Navigator.pushNamed(context, SnippetCodeView.routeName);
    } else if (item == 'Contact') {
      Navigator.pushNamed(context, ContactView.routeName);
    } else {
      // Handle other navigation items if needed
    }
  }

  Widget _buildHeader(BuildContext context) {
    return CustomHeader(
      selectedItem: 'What I Do',
      onNavItemClick: (item) => onNavItemClick(context, item),
    );
  }

  Widget _buildBiographySection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: SelectableText(
              "Hi I'm Mahmoud Ahmed, a special human with some ability to love learning and working on teamwork.",
              style: screenWidth < 800
                  ? AppTextStyles.bold24
                  : AppTextStyles.bold56,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 51),
        Center(
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              // Icons column
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      launchUrl(
                        Uri.parse(
                          'https://www.facebook.com/mahmoud.ahmed.794023',
                        ),
                      );
                    },
                    icon: const Icon(
                      FontAwesomeIcons.facebook,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('mailto:mahmoudahmedhsn@gmail.com'));
                    },
                    icon: const Icon(
                      FontAwesomeIcons.envelope,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              CircleAvatar(
                radius: 82,
                backgroundColor: AppColors.accent,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(Assets.imagesImageProfile),
                  backgroundColor: Colors.black,
                ),
              ),

              // Biography text
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      "Biography",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 20),
                    SelectableText(
                      "Passionate Flutter developer focused on scalable apps, "
                      "clean code, and intuitive design. Delivering production-level "
                      "solutions using Firebase, REST APIs, Cubit, and modern UI.",
                      style: AppTextStyles.normal14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
