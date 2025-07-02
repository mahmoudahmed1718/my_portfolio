import 'package:flutter/material.dart';
import 'package:portfolio/features/snippets/presentation/view/widgets/snippet_code_view_body.dart';

class SnippetCodeView extends StatelessWidget {
  const SnippetCodeView({super.key});
  static const String routeName = 'snippet-code';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CodeSnippetsViewBody());
  }
}
