import 'package:flutter/material.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/shared/widgets/meta_chip.dart';
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
    return Container(
      padding: EdgeInsets.all(featured ? 24 : 18),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderGray),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: featured
                      ? AppColors.broadcastRed
                      : AppColors.studioBlue.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  story.focus,
                  style: AppTextStyles.caption.copyWith(
                    color: featured
                        ? AppColors.paperWhite
                        : AppColors.studioBlue,
                  ),
                ),
              ),
              Text(story.category, style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            story.title,
            style: (featured ? AppTextStyles.pageTitle : AppTextStyles.headline)
                .copyWith(fontSize: featured ? 30 : (compact ? 19 : 22)),
          ),
          const SizedBox(height: 12),
          Text(
            story.summary,
            style: AppTextStyles.body.copyWith(fontSize: compact ? 15 : 16),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 14,
            runSpacing: 8,
            children: [
              MetaChip(icon: Icons.schedule_outlined, label: story.timeLabel),
              MetaChip(icon: Icons.mic_none_outlined, label: story.reporter),
              MetaChip(icon: Icons.place_outlined, label: story.location),
            ],
          ),
        ],
      ),
    );
  }
}
