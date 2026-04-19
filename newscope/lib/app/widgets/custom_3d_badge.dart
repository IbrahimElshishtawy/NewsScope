import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_depth_tokens.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dBadge extends StatelessWidget {
  const Custom3dBadge({
    super.key,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
  });

  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final background =
        backgroundColor ?? AppColors.midnightBlue.withValues(alpha: 0.08);
    final foreground = foregroundColor ?? AppColors.midnightBlue;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppDepthTokens.radiusXs),
        border: Border.all(color: foreground.withValues(alpha: 0.12)),
        boxShadow: [
          BoxShadow(
            color: foreground.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.rtl,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: foreground),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            textAlign: TextAlign.start,
            style: AppTextStyles.cardLabel.copyWith(color: foreground),
          ),
        ],
      ),
    );
  }
}
