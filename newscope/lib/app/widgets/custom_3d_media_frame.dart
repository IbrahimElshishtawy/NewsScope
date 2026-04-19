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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Custom3dPanel(
        tone: tone,
        radius: 28,
        padding: EdgeInsets.zero,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isHorizontal = width >= 460;
            final isCompact = width < 360;
            final cardPadding = isCompact ? 14.0 : 18.0;
            final gap = isCompact ? 12.0 : 16.0;
            final visualWidth = isHorizontal
                ? (width * 0.34).clamp(130.0, 220.0).toDouble()
                : width;
            final visualHeight = isHorizontal
                ? (visualWidth / aspectRatio).clamp(132.0, 190.0).toDouble()
                : (width / aspectRatio).clamp(118.0, 160.0).toDouble();
            final titleLines = isHorizontal ? 2 : 3;
            final summaryLines = isCompact ? 3 : 4;

            Widget buildVisualBox() {
              return Container(
                constraints: BoxConstraints(
                  minHeight: visualHeight,
                  maxHeight: visualHeight,
                ),
                decoration: App3dStyles.insetDecoration(
                  dark: isDark,
                  radius: 22,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: AppColors.broadcastRed.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.play_circle_fill_rounded,
                          size: 18,
                          color: isDark
                              ? AppColors.paperWhite
                              : AppColors.broadcastRed,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: isCompact ? 64 : 76,
                        height: isCompact ? 64 : 76,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.broadcastRed.withValues(alpha: 0.88),
                              AppColors.midnightBlue.withValues(alpha: 0.92),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.midnightBlue.withValues(
                                alpha: 0.16,
                              ),
                              blurRadius: 18,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(
                          icon,
                          size: isCompact ? 28 : 34,
                          color: AppColors.paperWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            Widget buildTextColumn() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (badge != null) ...[
                    Custom3dBadge(
                      label: badge!,
                      icon: Icons.bookmark_added_outlined,
                      backgroundColor: AppColors.broadcastRed.withValues(
                        alpha: isDark ? 0.16 : 0.10,
                      ),
                      foregroundColor: isDark
                          ? AppColors.paperWhite
                          : AppColors.broadcastRed,
                    ),
                    const SizedBox(height: 10),
                  ],
                  Text(
                    title,
                    maxLines: titleLines,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.cardTitle.copyWith(color: foreground),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    maxLines: summaryLines,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.cardBody.copyWith(color: secondary),
                  ),
                  if (footer != null) ...[
                    SizedBox(height: isCompact ? 10 : 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : AppColors.ivory.withValues(alpha: 0.84),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.08)
                              : AppColors.borderGray.withValues(alpha: 0.8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.schedule_rounded,
                            size: 14,
                            color: isDark
                                ? AppColors.paperWhite
                                : AppColors.broadcastRed,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              footer!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.cardMeta.copyWith(
                                color: secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              );
            }

            return Padding(
              padding: EdgeInsets.all(cardPadding),
              child: isHorizontal
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: buildTextColumn()),
                        SizedBox(width: gap),
                        SizedBox(width: visualWidth, child: buildVisualBox()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildVisualBox(),
                        SizedBox(height: gap),
                        buildTextColumn(),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
