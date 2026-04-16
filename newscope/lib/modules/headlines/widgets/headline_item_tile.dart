import 'package:flutter/material.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class HeadlineItemTile extends StatelessWidget {
  const HeadlineItemTile({
    super.key,
    required this.indexLabel,
    required this.story,
    this.isLead = false,
  });

  final String indexLabel;
  final ProgramStory story;
  final bool isLead;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isLead ? AppColors.ivory : AppColors.paperWhite,
        border: Border.all(
          color: isLead ? AppColors.broadcastRed : AppColors.borderGray,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.midnightBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    indexLabel,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.paperWhite,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    _metaChip(story.category),
                    _metaChip(story.timeLabel),
                    _metaChip(story.location),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(story.title, style: AppTextStyles.headline),
          const SizedBox(height: 10),
          Text(story.summary, style: AppTextStyles.body),
          const SizedBox(height: 12),
          Text(
            '${story.reporter}  |  ${story.focus}',
            style: AppTextStyles.caption.copyWith(color: AppColors.steelGray),
          ),
        ],
      ),
    );
  }

  Widget _metaChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: AppColors.midnightBlue.withValues(alpha: 0.06),
      ),
      child: Text(label, style: AppTextStyles.caption),
    );
  }
}
