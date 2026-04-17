import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_card.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dWeatherCard extends StatelessWidget {
  const Custom3dWeatherCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.details,
    required this.icon,
    this.range,
    this.tone = App3dTone.surface,
  });

  final String city;
  final String temperature;
  final String details;
  final IconData icon;
  final String? range;
  final App3dTone tone;

  @override
  Widget build(BuildContext context) {
    final isDark = tone != App3dTone.surface;
    final foreground = isDark ? AppColors.paperWhite : AppColors.midnightBlue;
    final secondary = isDark ? AppColors.softGray : AppColors.steelGray;

    return SizedBox(
      width: 230,
      child: Custom3dCard(
        tone: tone,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.broadcastRed.withValues(alpha: 0.85),
                        AppColors.midnightBlue.withValues(alpha: 0.85),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Icon(icon, color: AppColors.paperWhite),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Custom3dBadge(
                    label: city,
                    backgroundColor: isDark
                        ? Colors.white.withValues(alpha: 0.12)
                        : AppColors.midnightBlue.withValues(alpha: 0.06),
                    foregroundColor: foreground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              temperature,
              style: AppTextStyles.pageTitle.copyWith(
                color: foreground,
                fontSize: 34,
              ),
            ),
            const SizedBox(height: 6),
            Text(details, style: AppTextStyles.body.copyWith(color: secondary)),
            if (range != null) ...[
              const SizedBox(height: 10),
              Text(
                range!,
                style: AppTextStyles.caption.copyWith(color: secondary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
