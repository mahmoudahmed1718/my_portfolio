import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_text_styles.dart';
import 'package:portfolio/features/home/presentation/view/widgets/nav_item.dart';

class CustomAppBar extends StatelessWidget {
  final void Function(String section) onNavItemClick;
  final String selectedItem;

  const CustomAppBar({
    super.key,
    required this.onNavItemClick,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: SelectableText('Mahmoud Ahmed', style: AppTextStyles.bold24),
          ),
          Row(
            children: [
              NavItem(
                title: 'Home',
                isSelected: selectedItem == 'Home',
                onTap: () => onNavItemClick('Home'),
              ),
              NavItem(
                title: 'What I Do',
                isSelected: selectedItem == 'What I Do',
                onTap: () => onNavItemClick('What I Do'),
              ),
              NavItem(
                title: 'Portfolio',
                isSelected: selectedItem == 'Portfolio',
                onTap: () => onNavItemClick('Portfolio'),
              ),
              NavItem(
                title: 'Snippets',
                isSelected: selectedItem == 'Snippets',
                onTap: () => onNavItemClick('Snippets'),
              ),

              NavItem(
                title: 'Contact',
                isSelected: selectedItem == 'Contact',
                onTap: () => onNavItemClick('Contact'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
