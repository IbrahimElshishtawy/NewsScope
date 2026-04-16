import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/modules/main_news/controllers/main_news_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class MainNewsView extends GetView<MainNewsController> {
  const MainNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final leadStory = section.leadStory;

    return ProgramShell(
      title: 'Main News',
      subtitle: 'Flagship bulletin for the most important story of the day',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.midnightBlue, AppColors.studioBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 24,
                      offset: Offset(0, 14),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 11,
                              child: _buildHeroCopy(section: section),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              flex: 9,
                              child: _buildHeroMedia(leadStory),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeroCopy(section: section),
                            const SizedBox(height: 20),
                            _buildHeroMedia(leadStory),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 18,
                runSpacing: 18,
                children: section.highlights
                    .map((metric) => _buildMetricPanel(metric))
                    .toList(),
              ),
              const SizedBox(height: 24),
              Text('Supporting coverage', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              Wrap(
                spacing: 18,
                runSpacing: 18,
                children: section.sideStories
                    .map((story) => _buildSupportingStoryCard(story))
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeroCopy({required BroadcastSection section}) {
    final leadStory = section.leadStory;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildLabel(
              'Top Story',
              background: AppColors.broadcastRed,
              foreground: AppColors.paperWhite,
            ),
            _buildLabel(
              leadStory.category,
              background: AppColors.paperWhite.withValues(alpha: 0.12),
              foreground: AppColors.paperWhite,
            ),
            _buildLabel(
              leadStory.timeLabel,
              background: AppColors.paperWhite.withValues(alpha: 0.12),
              foreground: AppColors.paperWhite,
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          'Most Important Story Of The Day',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.softGray,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          leadStory.title,
          style: AppTextStyles.pageTitle.copyWith(
            color: AppColors.paperWhite,
            fontSize: 34,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          leadStory.summary,
          style: AppTextStyles.body.copyWith(
            color: AppColors.paperWhite.withValues(alpha: 0.9),
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.paperWhite.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.paperWhite.withValues(alpha: 0.12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key bulletin points',
                style: AppTextStyles.bodyStrong.copyWith(
                  color: AppColors.paperWhite,
                ),
              ),
              const SizedBox(height: 12),
              for (final item in section.agenda)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Icon(
                          Icons.circle,
                          size: 7,
                          color: AppColors.broadcastRed,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.paperWhite.withValues(alpha: 0.9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeroMedia(ProgramStory story) {
    return Container(
      constraints: const BoxConstraints(minHeight: 340),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFCFD6E0), Color(0xFFEEF1F6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: AppColors.borderGray),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 18,
                    left: 18,
                    child: Icon(
                      Icons.play_circle_fill_outlined,
                      color: AppColors.broadcastRed,
                      size: 34,
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.perm_media_outlined,
                      size: 72,
                      color: AppColors.steelGray,
                    ),
                  ),
                  Positioned(
                    right: 18,
                    bottom: 18,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.midnightBlue,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Featured image / video',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.paperWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text('Filed from ${story.location}', style: AppTextStyles.bodyStrong),
          const SizedBox(height: 8),
          Text(
            'Lead correspondent ${story.reporter} is guiding the bulletin focus on ${story.focus.toLowerCase()}.',
            style: AppTextStyles.body,
          ),
        ],
      ),
    );
  }
}

Widget _buildSupportingStoryCard(ProgramStory story) {
  return Container(
    constraints: const BoxConstraints(minWidth: 280, maxWidth: 390),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          story.category.toUpperCase(),
          style: AppTextStyles.caption.copyWith(color: AppColors.broadcastRed),
        ),
        const SizedBox(height: 10),
        Text(story.title, style: AppTextStyles.sectionTitle),
        const SizedBox(height: 10),
        Text(story.summary, style: AppTextStyles.body),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 18,
              color: AppColors.steelGray,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                '${story.location}  |  ${story.timeLabel}',
                style: AppTextStyles.caption,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMetricPanel(ProgramMetric metric) {
  return Container(
    width: 240,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
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

Widget _buildLabel(
  String text, {
  required Color background,
  required Color foreground,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(999),
    ),
    child: Text(text, style: AppTextStyles.caption.copyWith(color: foreground)),
  );
}
