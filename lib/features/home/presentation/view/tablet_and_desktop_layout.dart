import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/widgets/custom_footer.dart';
import 'package:portfolio/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:portfolio/features/home/presentation/view/widgets/home_biography_section.dart';
import 'package:portfolio/features/home/presentation/view/widgets/home_featured_project_section.dart';
import 'package:portfolio/features/home/presentation/view/widgets/home_hero_section.dart';
import 'package:portfolio/features/home/presentation/view/widgets/home_what_i_do_section.dart';
import 'package:portfolio/features/home/presentation/view/widgets/show_contact_home.dart';
import 'package:portfolio/features/snippets/presentation/view/widgets/home_senppit_section.dart';

class TabletAndDesktopLayout extends StatefulWidget {
  const TabletAndDesktopLayout({super.key});

  @override
  State<TabletAndDesktopLayout> createState() => _TabletAndDesktopLayoutState();
}

class _TabletAndDesktopLayoutState extends State<TabletAndDesktopLayout> {
  final heroKey = GlobalKey();
  final whatIDoKey = GlobalKey();
  final featuredKey = GlobalKey();
  final snippetsKey = GlobalKey();
  final contactKey = GlobalKey();

  String selectedItem = 'Home';

  void scrollTo(String section) {
    setState(() => selectedItem = section);

    if (section == 'Home') {
      Scrollable.ensureVisible(
        heroKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'What I Do') {
      Scrollable.ensureVisible(
        whatIDoKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'Portfolio') {
      Scrollable.ensureVisible(
        featuredKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'Snippets') {
      Scrollable.ensureVisible(
        snippetsKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'Contact') {
      Scrollable.ensureVisible(
        contactKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                onNavItemClick: scrollTo,
                selectedItem: selectedItem,
              ),

              const Divider(color: AppColors.normalText),
              const SizedBox(height: 20),
              HomeHeroSection(
                key: heroKey,
              ).animate().fade(duration: 600.ms).slideY(begin: 0.2),
              HomeBiographySection()
                  .animate()
                  .fade(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.2),
              HomeWhatIDoSection(key: whatIDoKey)
                  .animate()
                  .fade(duration: 600.ms, delay: 400.ms)
                  .slideY(begin: 0.2),
              HomeFeaturedProjectSection(key: featuredKey),
              HomeSnippetsSection(key: snippetsKey),
              const SizedBox(height: 60),
              ShowContactInHome(key: contactKey),
              const SizedBox(height: 16),
              const CustomFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
