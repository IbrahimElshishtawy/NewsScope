import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_card.dart';
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
    return Custom3dCard(
      tone: isLead ? App3dTone.dark : App3dTone.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Custom3dBadge(
                label: indexLabel,
                backgroundColor: isLead
                    ? Colors.white.withValues(alpha: 0.12)
                    : AppColors.midnightBlue,
                foregroundColor: AppColors.paperWhite,
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
          Text(
            story.title,
            style: AppTextStyles.headline.copyWith(
              color: isLead ? AppColors.paperWhite : null,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            story.summary,
            style: AppTextStyles.body.copyWith(
              color: isLead ? AppColors.softGray : null,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${story.reporter}  |  ${story.focus}',
            style: AppTextStyles.caption.copyWith(
              color: isLead ? AppColors.softGray : AppColors.steelGray,
            ),
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
        color: isLead
            ? Colors.white.withValues(alpha: 0.08)
            : AppColors.midnightBlue.withValues(alpha: 0.06),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: isLead ? AppColors.paperWhite : null,
        ),
      ),
    );
  }
}
