import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/modules/breaking_news/controllers/breaking_news_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class BreakingNewsView extends GetView<BreakingNewsController> {
  const BreakingNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final stories = [section.leadStory, ...section.sideStories];

    return ProgramShell(
      title: 'الأخبار العاجلة',
      subtitle: 'تصميم سريع ومنضبط للتغطية المباشرة المؤكدة.',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;
          final liveStack = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUrgentBanner(),
              const SizedBox(height: 18),
              _buildAnchorSummary(
                headline: section.leadStory.title,
                summary: section.leadStory.summary,
                anchorNote: section.quote.quote,
              ),
              const SizedBox(height: 18),
              Text('التحديثات المباشرة', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              Column(
                children: [
                  for (var index = 0; index < stories.length; index++) ...[
                    _buildLiveItem(stories[index], index + 1),
                    if (index != stories.length - 1) const SizedBox(height: 12),
                  ],
                ],
              ),
            ],
          );

          final sidePanel = _buildBreakingPanel(section.agenda);

          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 11, child: liveStack),
                    const SizedBox(width: 22),
                    Expanded(flex: 4, child: sidePanel),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [liveStack, const SizedBox(height: 18), sidePanel],
                );
        },
      ),
    );
  }

  Widget _buildUrgentBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.broadcastRed, Color(0xFF9B1B1B)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: AppColors.paperWhite),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'تحديث عاجل | يتم بث السطور المؤكدة فقط بعد التحقق',
              style: AppTextStyles.bodyStrong.copyWith(
                color: AppColors.paperWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnchorSummary({
    required String headline,
    required String summary,
    required String anchorNote,
  }) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.midnightBlue,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headline,
            style: AppTextStyles.pageTitle.copyWith(
              color: AppColors.paperWhite,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            summary,
            style: AppTextStyles.body.copyWith(
              color: AppColors.paperWhite.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.paperWhite.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              'ملخص المذيع: $anchorNote',
              style: AppTextStyles.body.copyWith(color: AppColors.paperWhite),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildLiveItem(ProgramStory story, int index) {
  return Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(20),
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
            color: AppColors.broadcastRed,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('$index', style: AppTextStyles.button),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(story.title, style: AppTextStyles.bodyStrong),
              const SizedBox(height: 8),
              Text(story.summary, style: AppTextStyles.body),
              const SizedBox(height: 10),
              Text(
                '${story.location}  |  ${story.timeLabel}',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildBreakingPanel(List<String> agenda) {
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.midnightBlue,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            'أولويات الشريط العاجل',
            style: AppTextStyles.bodyStrong.copyWith(
              color: AppColors.paperWhite,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...agenda.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.fiber_manual_record,
                    size: 10,
                    color: AppColors.broadcastRed,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(item, style: AppTextStyles.body)),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
