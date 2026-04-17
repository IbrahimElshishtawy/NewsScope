import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_card.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CustomNewsCard extends StatelessWidget {
  const CustomNewsCard({
    super.key,
    required this.story,
    this.featured = false,
    this.compact = false,
  });

  final ProgramStory story;
  final bool featured;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Custom3dCard(
      tone: featured ? App3dTone.dark : App3dTone.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              Custom3dBadge(
                label: story.focus,
                backgroundColor: featured
                    ? const Color(0x33FFFFFF)
                    : const Color(0x14C62828),
                foregroundColor: featured
                    ? Colors.white
                    : const Color(0xFFC62828),
              ),
              Custom3dBadge(
                label: story.category,
                backgroundColor: featured
                    ? const Color(0x1FFFFFFF)
                    : const Color(0x140B1F3A),
                foregroundColor: featured
                    ? Colors.white
                    : const Color(0xFF0B1F3A),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            story.title,
            style: (featured ? AppTextStyles.pageTitle : AppTextStyles.headline)
                .copyWith(
                  fontSize: featured ? 30 : (compact ? 19 : 22),
                  color: featured ? Colors.white : null,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            story.summary,
            style: AppTextStyles.body.copyWith(
              fontSize: compact ? 15 : 16,
              color: featured ? const Color(0xFFE5E8EE) : null,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 14,
            runSpacing: 8,
            children: [
              _buildMetaChip(
                icon: Icons.schedule_outlined,
                label: story.timeLabel,
                featured: featured,
              ),
              _buildMetaChip(
                icon: Icons.mic_none_outlined,
                label: story.reporter,
                featured: featured,
              ),
              _buildMetaChip(
                icon: Icons.place_outlined,
                label: story.location,
                featured: featured,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildMetaChip({
  required IconData icon,
  required String label,
  required bool featured,
}) {
  final color = featured ? AppColors.paperWhite : AppColors.steelGray;

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 15, color: color),
      const SizedBox(width: 6),
      Text(label, style: AppTextStyles.caption.copyWith(color: color)),
    ],
  );
}
