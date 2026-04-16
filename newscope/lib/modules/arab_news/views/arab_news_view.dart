import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/modules/arab_news/controllers/arab_news_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class ArabNewsView extends GetView<ArabNewsController> {
  const ArabNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final featuredStories = [section.leadStory, ...section.sideStories];

    return ProgramShell(
      title: 'أخبار عربية',
      subtitle: 'تغطية إقليمية بصياغة عربية رسمية متسقة مع هوية النشرة.',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.midnightBlue, AppColors.studioBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: isWide
                    ? Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: _buildRegionalMapPlaceholder(),
                          ),
                          const SizedBox(width: 22),
                          Expanded(
                            flex: 7,
                            child: _buildLeadStoryCard(section.leadStory),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRegionalMapPlaceholder(),
                          const SizedBox(height: 18),
                          _buildLeadStoryCard(section.leadStory),
                        ],
                      ),
              ),
              const SizedBox(height: 24),
              Text(
                'أبرز القصص الإقليمية',
                style: AppTextStyles.sectionTitle,
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 18,
                runSpacing: 18,
                children: featuredStories
                    .map((story) => _buildRegionalStoryCard(story))
                    .toList(),
              ),
              const SizedBox(height: 24),
              Text('بطاقات التحليل', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              Wrap(
                spacing: 18,
                runSpacing: 18,
                children: section.highlights
                    .map((metric) => _buildAnalysisCard(metric))
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRegionalMapPlaceholder() {
    return Container(
      constraints: const BoxConstraints(minHeight: 300),
      decoration: BoxDecoration(
        color: AppColors.paperWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.paperWhite.withValues(alpha: 0.12)),
      ),
      child: Stack(
        children: [
          const Positioned.fill(
            child: Center(
              child: Icon(
                Icons.public_outlined,
                size: 92,
                color: AppColors.paperWhite,
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: 18,
            child: Text(
              'خريطة إقليمية رمزية',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.paperWhite,
              ),
            ),
          ),
          for (final alignment in const [
            Alignment.topLeft,
            Alignment.center,
            Alignment.bottomRight,
          ])
            Align(
              alignment: alignment,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: AppColors.broadcastRed,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLeadStoryCard(ProgramStory story) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.category.toUpperCase(),
            style: AppTextStyles.caption.copyWith(
              color: AppColors.broadcastRed,
            ),
          ),
          const SizedBox(height: 10),
          Text(story.title, style: AppTextStyles.pageTitle),
          const SizedBox(height: 12),
          Text(story.summary, style: AppTextStyles.body),
          const SizedBox(height: 14),
          Text(
            '${story.location}  |  ${story.reporter}',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}

Widget _buildRegionalStoryCard(ProgramStory story) {
  return Container(
    constraints: const BoxConstraints(minWidth: 280, maxWidth: 390),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(story.focus, style: AppTextStyles.caption),
        const SizedBox(height: 8),
        Text(story.title, style: AppTextStyles.bodyStrong),
        const SizedBox(height: 10),
        Text(story.summary, style: AppTextStyles.body),
      ],
    ),
  );
}

Widget _buildAnalysisCard(ProgramMetric metric) {
  return Container(
    width: 250,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.ivory,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(metric.label, style: AppTextStyles.caption),
        const SizedBox(height: 8),
        Text(metric.value, style: AppTextStyles.headline),
        const SizedBox(height: 8),
        Text(metric.caption, style: AppTextStyles.body),
      ],
    ),
  );
}
