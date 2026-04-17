import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dSectionHeader extends StatelessWidget {
  const Custom3dSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.eyebrow,
    this.trailing,
    this.alignStart = true,
    this.foregroundColor,
    this.secondaryColor,
  });

  final String title;
  final String? subtitle;
  final String? eyebrow;
  final Widget? trailing;
  final bool alignStart;
  final Color? foregroundColor;
  final Color? secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: alignStart
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (eyebrow != null) ...[
                Custom3dBadge(
                  label: eyebrow!,
                  backgroundColor: AppColors.broadcastRed.withValues(
                    alpha: 0.12,
                  ),
                  foregroundColor: AppColors.broadcastRed,
                ),
                const SizedBox(height: 10),
              ],
              Text(
                title,
                style: AppTextStyles.pageTitle.copyWith(
                  color: foregroundColor ?? AppColors.paperWhite,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: AppTextStyles.body.copyWith(
                    color: secondaryColor ?? AppColors.softGray,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (trailing != null) ...[const SizedBox(width: 16), trailing!],
      ],
    );
  }
}
