import 'package:flutter/material.dart';

class SnippetEntity {
  final String title;
  final String description;
  final int stars;
  final List<IconData> icons;
  final String code;

  SnippetEntity({
    required this.title,
    required this.description,
    required this.stars,
    required this.icons,
    required this.code,
  });
}
