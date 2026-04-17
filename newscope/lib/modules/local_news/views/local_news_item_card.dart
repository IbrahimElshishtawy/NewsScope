import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_card.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class LocalNewsItemCard extends StatelessWidget {
  const LocalNewsItemCard({
    super.key,
    required this.story,
    required this.index,
  });

  final ProgramStory story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Custom3dCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom3dBadge(
            label: '$index',
            backgroundColor: AppColors.broadcastRed,
            foregroundColor: AppColors.paperWhite,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip(story.category),
                    _buildInfoChip(story.timeLabel),
                    _buildInfoChip(story.location),
                  ],
                ),
                const SizedBox(height: 12),
                Text(story.title, style: AppTextStyles.sectionTitle),
                const SizedBox(height: 8),
                Text(story.summary, style: AppTextStyles.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoChip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.ivory,
      borderRadius: BorderRadius.circular(999),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Text(text, style: AppTextStyles.caption),
  );
}
