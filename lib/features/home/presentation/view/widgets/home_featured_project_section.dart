import 'package:flutter/material.dart';
import 'package:portfolio/core/entites/project_entity.dart';
import 'package:portfolio/core/helper/all_projects_list.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/assets.dart';
import 'package:portfolio/features/home/presentation/view/widgets/project_card.dart';
import 'package:portfolio/features/projects/presentation/view/project_view.dart';

import 'package:visibility_detector/visibility_detector.dart';

class HomeFeaturedProjectSection extends StatefulWidget {
  const HomeFeaturedProjectSection({super.key});

  @override
  State<HomeFeaturedProjectSection> createState() =>
      _HomeFeaturedProjectSectionState();
}

class _HomeFeaturedProjectSectionState extends State<HomeFeaturedProjectSection>
    with TickerProviderStateMixin {
  bool _isVisible = false;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0.0), // Slide from right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.25 && !_isVisible) {
      _controller.forward();
      _isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('featured-project-section'),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            // color: AppColors.background,
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 850;

                List<ProjectEntity> displayedProjects = allProjects
                    .take(2)
                    .toList();

                List<Widget> projectCards = displayedProjects
                    .map(
                      (project) => ProjectCard(
                        imagePath: project.imagePath,
                        type: project.type,
                        title: project.title,
                        description: project.description,
                        url: project.url,
                      ),
                    )
                    .toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SelectableText(
                      'Featured Project',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Image.asset(Assets.imagesNew),
                    ),
                    const SizedBox(height: 10),
                    isWide
                        ? Wrap(
                            spacing: 32,
                            runSpacing: 32,
                            children: projectCards,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: projectCards
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 32),
                                    child: e,
                                  ),
                                )
                                .toList(),
                          ),

                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, ProjectsView.routeName);
                        },
                        icon: Icon(Icons.menu),
                        label: SelectableText('See More'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.background,
                          foregroundColor: AppColors.white,
                          side: const BorderSide(
                            color: AppColors.secondaryText,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
