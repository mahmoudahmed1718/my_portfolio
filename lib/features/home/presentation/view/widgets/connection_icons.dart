import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:portfolio/core/helper/url_lanucher_function.dart';
import 'package:portfolio/features/home/presentation/view/widgets/section_icon.dart';

class ConnectionIcons extends StatelessWidget {
  const ConnectionIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialIcon(
          icon: Icon(
            FontAwesomeIcons.linkedinIn,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () => lunchCustomUrl(
            'https://www.linkedin.com/in/mahmoud-ahmed-hassan-8091b8283/',
          ),
        ),
        const SizedBox(width: 12),
        SocialIcon(
          icon: Icon(FontAwesomeIcons.github, size: 30, color: Colors.white),
          onPressed: () =>
              lunchCustomUrl('https://github.com/mahmoudahmed1718'),
        ),
        const SizedBox(width: 12),
        SocialIcon(
          icon: Icon(FontAwesomeIcons.envelope, size: 30, color: Colors.white),
          onPressed: () => lunchCustomUrl('mailto:mahmoudahmedhsn@gmail.com'),
        ),
      ],
    );
  }
}
