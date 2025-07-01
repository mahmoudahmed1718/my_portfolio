import 'package:flutter/material.dart';
import 'package:portfolio/core/helper/all_snippets.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/features/home/presentation/view/widgets/snippet_card.dart';
import 'package:portfolio/features/home/presentation/view/widgets/snippet_code_diolog.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeSnippetsSection extends StatefulWidget {
  const HomeSnippetsSection({super.key});

  @override
  State<HomeSnippetsSection> createState() => _HomeSnippetsSectionState();
}

class _HomeSnippetsSectionState extends State<HomeSnippetsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
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
      key: const Key('snippet-section'),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
          opacity: _controller,
          child: Container(
            color: AppColors.background,
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SelectableText(
                  'Code Snippet',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final crossAxisCount = width > 1100
                        ? 4
                        : width > 600
                        ? 2
                        : 1;

                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.4,
                      children: allSnippets
                          .take(4)
                          .map(
                            (snippet) => GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => SnippetCodeDialog(
                                    title: snippet.title,
                                    code: snippet.code,
                                  ),
                                );
                              },
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width *
                                    0.3871507795,
                                child: SnippetCard(
                                  title: snippet.title,
                                  description: snippet.description,
                                  stars: snippet.stars,
                                  icons: snippet.icons,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),

                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // GoRouter.of(context).push(AppRouter.kSnippets);
                    },
                    icon: Icon(Icons.menu),
                    label: Text('See More'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background,
                      foregroundColor: AppColors.white,
                      side: const BorderSide(color: AppColors.secondaryText),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
              ],
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
