import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/data/models/main_news_model.dart';
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
    final mainNews = controller.mainNews;
    final leadStory = section.leadStory;

    return ProgramShell(
      title: mainNews.category,
      subtitle: 'الملف الأبرز في نشرة الليلة بصياغة تفصيلية واضحة.',
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
                              child: _buildHeroCopy(
                                story: leadStory,
                                mainNews: mainNews,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              flex: 9,
                              child: _buildHeroMedia(
                                story: leadStory,
                                imageUrl: mainNews.imageUrl,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeroCopy(story: leadStory, mainNews: mainNews),
                            const SizedBox(height: 20),
                            _buildHeroMedia(
                              story: leadStory,
                              imageUrl: mainNews.imageUrl,
                            ),
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
              Text('مسارات التغطية المساندة', style: AppTextStyles.sectionTitle),
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

  Widget _buildHeroCopy({
    required ProgramStory story,
    required MainNewsModel mainNews,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildLabel(
              'الملف الأبرز',
              background: AppColors.broadcastRed,
              foreground: AppColors.paperWhite,
            ),
            _buildLabel(
              story.category,
              background: AppColors.paperWhite.withValues(alpha: 0.12),
              foreground: AppColors.paperWhite,
            ),
            _buildLabel(
              story.timeLabel,
              background: AppColors.paperWhite.withValues(alpha: 0.12),
              foreground: AppColors.paperWhite,
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          'العنوان الرئيسي في هذه النشرة',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.softGray,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          story.title,
          style: AppTextStyles.pageTitle.copyWith(
            color: AppColors.paperWhite,
            fontSize: 34,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          story.summary,
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
                'نقاط المتابعة الرئيسية',
                style: AppTextStyles.bodyStrong.copyWith(
                  color: AppColors.paperWhite,
                ),
              ),
              const SizedBox(height: 12),
              for (final item in mainNews.bulletPoints)
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

  Widget _buildHeroMedia({
    required ProgramStory story,
    required String imageUrl,
  }) {
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
                        'صورة رئيسية: $imageUrl',
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
          Text('المتابعة من ${story.location}', style: AppTextStyles.bodyStrong),
          const SizedBox(height: 8),
          Text(
            'تتولى ${story.reporter} تقديم هذا الملف مع تركيز واضح على ${story.focus}.',
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
          story.category,
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
