import 'package:flutter/material.dart';
import 'package:portfolio/features/about_me/presentation/view/about_me_view.dart';
import 'package:portfolio/features/contact_section.dart/presentation/view/contact_view.dart';

void showMoreOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black87,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text(
              'About Me',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AboutMeView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail, color: Colors.white),
            title: const Text('Contact', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ContactView.routeName);
            },
          ),
        ],
      );
    },
  );
}
