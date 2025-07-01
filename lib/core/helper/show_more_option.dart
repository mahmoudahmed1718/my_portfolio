import 'package:flutter/material.dart';

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
              // GoRouter.of(context).pop();
              // GoRouter.of(context).push(AppRouter.kAbout);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail, color: Colors.white),
            title: const Text('Contact', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              // GoRouter.of(context).push(AppRouter.kContact);
            },
          ),
        ],
      );
    },
  );
}
