import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class SnippetCodeDialog extends StatelessWidget {
  final String title;
  final String code;

  const SnippetCodeDialog({super.key, required this.title, required this.code});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2E3440),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                CircleAvatar(radius: 6, backgroundColor: Colors.red),
                SizedBox(width: 6),
                CircleAvatar(radius: 6, backgroundColor: Colors.yellow),
                SizedBox(width: 6),
                CircleAvatar(radius: 6, backgroundColor: Colors.green),
              ],
            ),
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),

            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B4252),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: const BoxConstraints(maxHeight: 400),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: HighlightView(
                      code,
                      language: 'dart',
                      theme: monokaiSublimeTheme,
                      padding: const EdgeInsets.all(8),
                      textStyle: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: code));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Code copied to clipboard!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.copy, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
