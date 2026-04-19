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
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              Custom3dBadge(
                label: 'اقتباس رئيسي',
                icon: Icons.format_quote_rounded,
                backgroundColor: AppColors.broadcastRed.withValues(alpha: 0.14),
                foregroundColor: isDark
                    ? AppColors.paperWhite
                    : AppColors.broadcastRed,
              ),
              Icon(
                Icons.graphic_eq_rounded,
                size: 18,
                color: foreground.withValues(alpha: 0.64),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            '"$quote"',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppTextStyles.cardTitle.copyWith(
              color: foreground,
              height: 1.75,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            speaker,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.cardTitleSecondary.copyWith(color: foreground),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.cardBody.copyWith(color: secondary),
          ),
          if (source != null) ...[
            const SizedBox(height: 10),
            Text(
              source!,
              style: AppTextStyles.cardMeta.copyWith(color: secondary),
            ),
          ],
        ],
      ),
    );
  }
}
