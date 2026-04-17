import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_panel.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dQuoteBox extends StatelessWidget {
  const Custom3dQuoteBox({
    super.key,
    required this.quote,
    required this.speaker,
    required this.role,
    this.source,
    this.tone = App3dTone.dark,
  });

  final String quote;
  final String speaker;
  final String role;
  final String? source;
  final App3dTone tone;

  @override
  Widget build(BuildContext context) {
    final isDark = tone != App3dTone.surface;
    final foreground = isDark ? AppColors.paperWhite : AppColors.midnightBlue;
    final secondary = isDark ? AppColors.softGray : AppColors.steelGray;

    return Custom3dPanel(
      tone: tone,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Custom3dBadge(
                label: 'اقتباس رئيسي',
                icon: Icons.format_quote_rounded,
                backgroundColor: AppColors.broadcastRed.withValues(alpha: 0.14),
                foregroundColor: isDark
                    ? AppColors.paperWhite
                    : AppColors.broadcastRed,
              ),
              const Spacer(),
              Icon(
                Icons.graphic_eq_rounded,
                color: foreground.withValues(alpha: 0.7),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '"$quote"',
            style: AppTextStyles.pageTitle.copyWith(
              color: foreground,
              fontSize: 30,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            speaker,
            style: AppTextStyles.headline.copyWith(color: foreground),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: AppTextStyles.body.copyWith(color: secondary, fontSize: 15),
          ),
          if (source != null) ...[
            const SizedBox(height: 10),
            Text(
              source!,
              style: AppTextStyles.caption.copyWith(color: secondary),
            ),
          ],
        ],
      ),
    );
  }
}
