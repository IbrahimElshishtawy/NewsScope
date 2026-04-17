import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_panel.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dMediaFrame extends StatelessWidget {
  const Custom3dMediaFrame({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.badge,
    this.footer,
    this.aspectRatio = 16 / 9,
    this.tone = App3dTone.surface,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String? badge;
  final String? footer;
  final double aspectRatio;
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
          AspectRatio(
            aspectRatio: aspectRatio,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          Colors.white.withValues(alpha: 0.08),
                          Colors.white.withValues(alpha: 0.03),
                        ]
                      : [Colors.white, const Color(0xFFE8EEF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : AppColors.borderGray.withValues(alpha: 0.8),
                ),
              ),
              child: Stack(
                children: [
                  for (final top in [30.0, 72.0, 114.0, 156.0])
                    Positioned(
                      left: 18,
                      right: 18,
                      top: top,
                      child: Container(
                        height: 1,
                        color: foreground.withValues(alpha: 0.08),
                      ),
                    ),
                  if (badge != null)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Custom3dBadge(
                        label: badge!,
                        icon: Icons.play_circle_fill_outlined,
                        backgroundColor: AppColors.broadcastRed.withValues(
                          alpha: 0.18,
                        ),
                        foregroundColor: isDark
                            ? AppColors.paperWhite
                            : AppColors.broadcastRed,
                      ),
                    ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 72, color: foreground),
                        const SizedBox(height: 10),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headline.copyWith(
                            color: foreground,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text(
                            subtitle,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.body.copyWith(
                              color: secondary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (footer != null) ...[
            const SizedBox(height: 14),
            Text(
              footer!,
              style: AppTextStyles.caption.copyWith(color: secondary),
            ),
          ],
        ],
      ),
    );
  }
}
