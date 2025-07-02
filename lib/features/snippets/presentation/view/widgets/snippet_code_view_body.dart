import 'package:flutter/material.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/core/entites/snpittes_entity.dart';
import 'package:portfolio/core/helper/all_snippets.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/widgets/custom_footer.dart';
import 'package:portfolio/core/widgets/custom_header.dart';
import 'package:portfolio/features/about_me/presentation/view/about_me_view.dart';
import 'package:portfolio/features/contact_section.dart/presentation/view/contact_view.dart';
import 'package:portfolio/features/projects/presentation/view/project_view.dart';
import 'package:portfolio/features/snippets/presentation/view/widgets/responsive_snippet_grid_view.dart';
import 'package:portfolio/features/snippets/presentation/view/widgets/snippet_header_secion.dart';
import 'package:portfolio/features/snippets/presentation/view/widgets/snippet_search_field.dart';

class CodeSnippetsViewBody extends StatefulWidget {
  const CodeSnippetsViewBody({super.key});

  @override
  State<CodeSnippetsViewBody> createState() => _CodeSnippetsViewBodyState();
}

class _CodeSnippetsViewBodyState extends State<CodeSnippetsViewBody> {
  final TextEditingController _searchController = TextEditingController();
  String selectedItem = 'Snippets';
  List<SnippetEntity> filteredSnippets = allSnippets;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
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

  void onNavItemClick(String section) {
    setState(() => selectedItem = section);

    if (section == 'What I Do') {
      Navigator.pushNamed(context, AboutMeView.routeName);
    } else if (section == 'Portfolio') {
      Navigator.pushNamed(context, ProjectsView.routeName);
    } else if (section == 'Contact') {
      Navigator.pushNamed(context, ContactView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constrains) => constrains.maxWidth < 800
          ? SizedBox() // neeed here Mobile snippets
          : buildSnippetsDesktopLayout(width),
    );
  }

  SingleChildScrollView buildSnippetsDesktopLayout(double width) {
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
            const SizedBox(height: 78),
            const SnippetsHeaderSection(),
            SnippetsSearchField(
              searchController: _searchController,
              onChanged: (_) {},
            ),
            const SizedBox(height: 40),
            ResponsiveSnippetGrid(snippets: filteredSnippets),
            const SizedBox(height: 80),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
