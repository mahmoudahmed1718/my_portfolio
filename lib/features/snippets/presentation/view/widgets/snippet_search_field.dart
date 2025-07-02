import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

class SnippetsSearchField extends StatelessWidget {
  const SnippetsSearchField({
    super.key,
    required TextEditingController searchController,
    this.onChanged,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF3E4051),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.secondaryText),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: onChanged,
              style: const TextStyle(color: AppColors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(color: Color(0xFF9C9C9C)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
