import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_text_styles.dart';
import 'package:portfolio/core/widgets/switch_item.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.onNavItemClick,
    required this.selectedItem,
  });
  final void Function(String section) onNavItemClick;
  final String selectedItem;
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
              SwitchItem(
                title: 'What I Do',
                isSelected: selectedItem == 'What I Do',
                onTap: () => onNavItemClick('What I Do'),
              ),

              SwitchItem(
                title: 'Portfolio',
                isSelected: selectedItem == 'Portfolio',
                onTap: () => onNavItemClick('Portfolio'),
              ),
              SwitchItem(
                title: 'Snippets',
                isSelected: selectedItem == 'Snippets',
                onTap: () => onNavItemClick('Snippets'),
              ),

              SwitchItem(
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
