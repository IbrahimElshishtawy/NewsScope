import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class MetaChip extends StatelessWidget {
  const MetaChip({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: AppColors.steelGray),
        const SizedBox(width: 6),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}
