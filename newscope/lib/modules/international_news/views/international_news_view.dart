import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/modules/international_news/controllers/international_news_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class InternationalNewsView extends GetView<InternationalNewsController> {
  const InternationalNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final stories = [section.leadStory, ...section.sideStories];

    return ProgramShell(
      title: 'أخبار دولية',
      subtitle: 'جولة عالمية بعناوين رئيسية ومؤشرات سريعة من مكاتب المتابعة.',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;
          final mainList = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWorldMapBanner(),
              const SizedBox(height: 24),
              Text('العناوين الدولية', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              Column(
                children: [
                  for (var index = 0; index < stories.length; index++) ...[
                    _buildHeadlineTile(stories[index], index + 1),
                    if (index != stories.length - 1) const SizedBox(height: 14),
                  ],
                ],
              ),
            ],
          );

          final statsPanel = _buildStatsPanel(
            section.highlights,
            section.tickerItems,
          );

          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 11, child: mainList),
                    const SizedBox(width: 22),
                    Expanded(flex: 4, child: statsPanel),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [mainList, const SizedBox(height: 18), statsPanel],
                );
        },
      ),
    );
  }

  Widget _buildWorldMapBanner() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.midnightBlue, AppColors.studioBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: AppColors.paperWhite.withValues(alpha: 0.12),
                  ),
                ),
              ),
            ),
            for (final top in [32.0, 68.0, 104.0, 140.0])
              Positioned(
                left: 0,
                right: 0,
                top: top,
                child: Container(
                  height: 1,
                  color: AppColors.paperWhite.withValues(alpha: 0.08),
                ),
              ),
            const Center(
              child: Icon(
                Icons.language_outlined,
                size: 92,
                color: AppColors.paperWhite,
              ),
            ),
            Positioned(
              left: 18,
              top: 18,
              child: Text(
                'خلفية خريطة العالم',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.paperWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeadlineTile(ProgramStory story, int index) {
  return Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.midnightBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('$index', style: AppTextStyles.button),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(story.title, style: AppTextStyles.sectionTitle),
              const SizedBox(height: 8),
              Text(story.summary, style: AppTextStyles.body),
              const SizedBox(height: 10),
              Text(
                '${story.location}  |  ${story.category}',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildStatsPanel(List<ProgramMetric> metrics, List<String> updates) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('مؤشرات سريعة', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 14),
        ...metrics.map(
          (metric) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.ivory,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(metric.label, style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  Text(metric.value, style: AppTextStyles.headline),
                  const SizedBox(height: 6),
                  Text(metric.caption, style: AppTextStyles.body),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text('تحديثات المكاتب', style: AppTextStyles.bodyStrong),
        const SizedBox(height: 10),
        ...updates
            .take(3)
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(item, style: AppTextStyles.body),
              ),
            ),
      ],
    ),
  );
}
