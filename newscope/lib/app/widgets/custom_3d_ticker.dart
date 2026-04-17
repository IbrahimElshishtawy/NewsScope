import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/theme/app_depth_tokens.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class Custom3dTicker extends StatelessWidget {
  const Custom3dTicker({
    super.key,
    required this.items,
    this.label = 'البث المباشر',
    this.isUrgent = false,
  });

  final List<String> items;
  final String label;
  final bool isUrgent;

  @override
  Widget build(BuildContext context) {
    final background = isUrgent ? App3dTone.accent : App3dTone.dark;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      decoration: App3dStyles.panelDecoration(
        tone: background,
        radius: AppDepthTokens.radiusMd,
        accentColor: AppColors.broadcastRed,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Custom3dBadge(
              label: label,
              icon: isUrgent
                  ? Icons.priority_high_rounded
                  : Icons.wifi_tethering,
              backgroundColor: Colors.white.withValues(alpha: 0.14),
              foregroundColor: AppColors.paperWhite,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final item in items) ...[
                      Text(
                        item,
                        style: AppTextStyles.ticker.copyWith(
                          color: AppColors.paperWhite,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: AppColors.broadcastRed,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
