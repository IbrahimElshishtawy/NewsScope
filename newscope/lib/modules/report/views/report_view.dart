import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/modules/report/controllers/report_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;

    return ProgramShell(
      title: 'Special Report',
      subtitle: 'Long-form analytical package with layered newsroom framing',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;
          final mainColumn = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeatureCard(section.leadStory),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: AppColors.paperWhite,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderGray),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Report Summary', style: AppTextStyles.sectionTitle),
                    const SizedBox(height: 14),
                    Text(section.leadStory.summary, style: AppTextStyles.body),
                    const SizedBox(height: 18),
                    Text('Field notes', style: AppTextStyles.bodyStrong),
                    const SizedBox(height: 12),
                    ...section.sideStories.map(
                      (story) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildFieldNote(story),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );

          final sidePanel = Column(
            children: [
              _buildHighlightsCard(section.highlights),
              const SizedBox(height: 18),
              _buildAgendaCard(section.agenda),
            ],
          );

          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 12, child: mainColumn),
                    const SizedBox(width: 22),
                    Expanded(flex: 5, child: sidePanel),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [mainColumn, const SizedBox(height: 18), sidePanel],
                );
        },
      ),
    );
  }

  Widget _buildFeatureCard(ProgramStory story) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.borderGray),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 14,
            top: -12,
            child: Container(
              width: 124,
              height: 124,
              decoration: BoxDecoration(
                color: AppColors.broadcastRed.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.midnightBlue, AppColors.studioBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Stack(
                    children: [
                      const Center(
                        child: Icon(
                          Icons.ondemand_video_outlined,
                          size: 86,
                          color: AppColors.paperWhite,
                        ),
                      ),
                      Positioned(
                        top: 18,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.broadcastRed,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'تقرير خاص',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.paperWhite,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 18,
                        bottom: 18,
                        child: Text(
                          'Large media placeholder',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.paperWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(story.title, style: AppTextStyles.pageTitle),
              const SizedBox(height: 10),
              Text(
                '${story.location}  |  ${story.reporter}  |  ${story.timeLabel}',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildFieldNote(ProgramStory story) {
  return Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.ivory,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          story.category.toUpperCase(),
          style: AppTextStyles.caption.copyWith(color: AppColors.broadcastRed),
        ),
        const SizedBox(height: 8),
        Text(story.title, style: AppTextStyles.bodyStrong),
        const SizedBox(height: 8),
        Text(story.summary, style: AppTextStyles.body),
      ],
    ),
  );
}

Widget _buildHighlightsCard(List<ProgramMetric> metrics) {
  return Container(
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: AppColors.midnightBlue,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facts & Highlights',
          style: AppTextStyles.sectionTitle.copyWith(
            color: AppColors.paperWhite,
          ),
        ),
        const SizedBox(height: 18),
        ...metrics.map(
          (metric) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.paperWhite.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.paperWhite.withValues(alpha: 0.12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    metric.label,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.softGray,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    metric.value,
                    style: AppTextStyles.headline.copyWith(
                      color: AppColors.paperWhite,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    metric.caption,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.paperWhite.withValues(alpha: 0.86),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildAgendaCard(List<String> agenda) {
  return Container(
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Segment Structure', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 14),
        for (var index = 0; index < agenda.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.broadcastRed,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.paperWhite,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(agenda[index], style: AppTextStyles.body)),
              ],
            ),
          ),
      ],
    ),
  );
}
