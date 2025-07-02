import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:portfolio/core/helper/send_email_from_flutter.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/widgets/custom_footer.dart';
import 'package:portfolio/core/widgets/custom_header.dart';
import 'package:portfolio/features/about_me/presentation/view/about_me_view.dart';
import 'package:portfolio/features/home/presentation/view/widgets/home_profile.dart';
import 'package:portfolio/features/projects/presentation/view/project_view.dart';
import 'package:portfolio/features/snippets/presentation/view/snippet_code_view.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String selectedItem = 'Contact';

  void onNavItemClick(String section) {
    setState(() => selectedItem = section);
    if (section == 'What I Do') {
      Navigator.pushNamed(context, AboutMeView.routeName);
    } else if (section == 'Portfolio') {
      Navigator.pushNamed(context, ProjectsView.routeName);
    } else if (section == 'Snippets') {
      Navigator.pushNamed(context, SnippetCodeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 40,
          child: _blurredCircle(180, Colors.teal.withValues(alpha: 0.08))
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .move(
                duration: 6000.ms,
                begin: const Offset(0, 0),
                end: const Offset(30, 0),
              ),
        ),

        Positioned(
          bottom: 60,
          right: 60,
          child: _blurredCircle(140, Colors.purple.withValues(alpha: 0.07))
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .move(
                duration: 8000.ms,
                begin: const Offset(0, 0),
                end: const Offset(0, -20),
              ),
        ),

        Positioned(
          top: 200,
          right: 120,
          child: _blurredCircle(100, Colors.blueGrey.withValues(alpha: 0.06))
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .move(
                duration: 10000.ms,
                begin: const Offset(0, 0),
                end: const Offset(-20, 10),
              ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            screenWidth < 800
                ? const SizedBox()
                : CustomHeader(
                    onNavItemClick: onNavItemClick,
                    selectedItem: selectedItem,
                  ),
            screenWidth < 800 ? const SizedBox() : const Divider(),
            const SizedBox(height: 60),
            const HomeProfile(),
            const SizedBox(height: 32),
            Text(
              "Contact Me",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ).animate().slideY(duration: 500.ms).fadeIn(),

            const SizedBox(height: 12),
            const Text(
              "I'm open to freelance projects, collaborations, or just a friendly chat.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms),

            const SizedBox(height: 60),

            // Content: Row layout
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 700;
                return isMobile
                    ? Column(
                        children: [
                          _buildContactInfo().animate().fadeIn(),
                          const SizedBox(height: 32),
                          _buildForm().animate().fadeIn(delay: 200.ms),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactInfo().animate().fadeIn(),
                          const SizedBox(width: 48),
                          Expanded(
                            flex: 1,
                            child: _buildForm().animate().fadeIn(delay: 200.ms),
                          ),
                        ],
                      );
              },
            ),

            const SizedBox(height: 60),
            const CustomFooter(),
          ],
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contactRow(
          FontAwesomeIcons.whatsapp,
          "+201065025877",
          "https://wa.me/+201065025877",
          AppColors.white,
        ),
        const SizedBox(height: 16),
        _contactRow(
          FontAwesomeIcons.envelope,
          "mahmoudahmedhsn@gmail.com",
          "mailto:mahmoudahmedhsn@gmail.com",
          AppColors.white,
        ),
        const SizedBox(height: 16),

        _contactRow(
          FontAwesomeIcons.github,
          "GitHub",
          "https://github.com/mahmoudahmed1718",
          AppColors.white,
        ),
        const SizedBox(height: 16),
        _contactRow(
          FontAwesomeIcons.linkedinIn,
          "LinkedIn",
          "https://www.linkedin.com/in/mahmoud-ahmed-hassan-8091b8283",
          AppColors.white,
        ),
        const SizedBox(height: 16),
        _contactRow(
          FontAwesomeIcons.facebook,
          "Facebook",
          "https://www.facebook.com/mahmoud.ahmed.794023",
          AppColors.white,
        ),
        const SizedBox(height: 16),
        _contactRow(
          FontAwesomeIcons.instagram,
          "Instagram",
          "https://www.instagram.com/mo.hassan.tv?igsh=MWRoc3VyczBnb3E5cw==",
          AppColors.white,
        ),

        // const SizedBox(height: 16),
        // _contactRow(
        //   FontAwesomeIcons.twitter,
        //   "Twitter",
        //   "https://x.com/abdelrahma42501",
        //   AppColors.white,
        // ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _textInput(_nameController, "Your Name"),
          const SizedBox(height: 16),
          _textInput(_emailController, "Your Email"),
          const SizedBox(height: 16),
          _textInput(_messageController, "Your Message", maxLines: 5),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                sendEmail(
                  _nameController.text,
                  _emailController.text,
                  _messageController.text,
                );
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Send", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _textInput(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This field is required";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _contactRow(IconData icon, String label, String url, Color color) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white.withValues(alpha: 0.5), size: 26),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _blurredCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
