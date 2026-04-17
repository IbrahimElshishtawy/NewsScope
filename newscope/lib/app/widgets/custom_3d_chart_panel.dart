import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_panel.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dChartPanel extends StatelessWidget {
  const Custom3dChartPanel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.height = 240,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Custom3dPanel(
      tone: App3dTone.dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.sectionTitle.copyWith(
                        color: AppColors.paperWhite,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.softGray,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Custom3dBadge(
                label: 'لوحة تحليل',
                icon: icon,
                backgroundColor: Colors.white.withValues(alpha: 0.10),
                foregroundColor: AppColors.paperWhite,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.08),
                  Colors.white.withValues(alpha: 0.03),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Stack(
              children: [
                for (final top in [36.0, 84.0, 132.0, 180.0])
                  Positioned(
                    top: top,
                    left: 16,
                    right: 16,
                    child: Container(
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                for (final item in [
                  (left: 40.0, height: 54.0),
                  (left: 96.0, height: 92.0),
                  (left: 152.0, height: 68.0),
                  (left: 208.0, height: 124.0),
                  (left: 264.0, height: 108.0),
                ])
                  Positioned(
                    left: item.left,
                    bottom: 20,
                    child: Container(
                      width: 28,
                      height: item.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.broadcastRed.withValues(alpha: 0.8),
                            AppColors.paperWhite.withValues(alpha: 0.30),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                Center(
                  child: Icon(
                    icon,
                    size: 58,
                    color: Colors.white.withValues(alpha: 0.88),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
