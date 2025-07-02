import 'package:flutter/material.dart';
import 'package:portfolio/core/entites/snpittes_entity.dart';
import 'package:portfolio/core/helper/all_snippets.dart';
import 'package:portfolio/core/helper/show_more_option.dart';
import 'package:portfolio/core/widgets/custom_footer.dart';
import 'package:portfolio/core/widgets/mobil_bottom_nav.dart';
import 'package:portfolio/features/home/presentation/view/home_view.dart';
import 'package:portfolio/features/home/presentation/view/mobil_projects.dart';
import 'package:portfolio/features/snippets/presentation/view/widgets/responsive_snippet_grid_view.dart';
import 'package:portfolio/features/snippets/presentation/view/widgets/snippet_header_secion.dart';
import 'package:portfolio/features/snippets/presentation/view/widgets/snippet_search_field.dart';

class MobileSnippets extends StatelessWidget {
  static const String routeName = 'mobil_snippets';
  const MobileSnippets({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MobileSnippetsBody());
  }
}

class MobileSnippetsBody extends StatefulWidget {
  const MobileSnippetsBody({super.key});

  @override
  State<MobileSnippetsBody> createState() => _MobileSnippetsBodyState();
}

class _MobileSnippetsBodyState extends State<MobileSnippetsBody> {
  final TextEditingController _searchController = TextEditingController();
  String selectedItem = 'Snippets';
  List<SnippetEntity> filteredSnippets = allSnippets;
  int currentIndex = 2;
  bool isNavBarVisible = true;
  late ScrollController _scrollController;

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
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredSnippets = allSnippets.where((snippet) {
        return snippet.title.toLowerCase().contains(query) ||
            snippet.description.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MobileBottomNav(
        isNavBarVisible: isNavBarVisible,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
          } else if (index == 0) {
            Navigator.pushNamed(context, HomeView.routeName);
          } else if (index == 1) {
            Navigator.pushNamed(context, MobileProjects.routeName);
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 28),
              const SnippetsHeaderSection(),
              SnippetsSearchField(
                searchController: _searchController,
                onChanged: (_) {},
              ),
              const SizedBox(height: 40),
              ResponsiveSnippetGrid(snippets: filteredSnippets),
              const SizedBox(height: 16),
              const CustomFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
