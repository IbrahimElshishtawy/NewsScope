import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.eyebrow,
  });

  final String title;
  final String? subtitle;
  final String? eyebrow;

  @override
  Widget build(BuildContext context) {
    return Custom3dSectionHeader(
      title: title,
      subtitle: subtitle,
      eyebrow: eyebrow,
    );
  }
}
