import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;

  const SocialIcon({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
