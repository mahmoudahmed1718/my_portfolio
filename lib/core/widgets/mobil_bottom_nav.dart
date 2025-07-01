import 'package:flutter/material.dart';

class MobileBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isNavBarVisible;

  const MobileBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.isNavBarVisible,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isNavBarVisible ? 95 : 0,
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: "Portfolio",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: "Snippets"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}
