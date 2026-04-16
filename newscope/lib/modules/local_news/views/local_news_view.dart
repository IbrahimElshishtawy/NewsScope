import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/local_news/controllers/local_news_controller.dart';
import 'package:newscope/modules/local_news/views/local_news_item_card.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class LocalNewsView extends GetView<LocalNewsController> {
  const LocalNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final stories = [section.leadStory, ...section.sideStories];

    return ProgramShell(
      title: 'أخبار محلية',
      subtitle: 'تغطية محلية رسمية تركز على الأثر الخدمي والتنمية اليومية.',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;

          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocalHero(
                section.leadStory.title,
                section.leadStory.location,
              ),
              const SizedBox(height: 24),
              Text('النشرة المحلية', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              Column(
                children: [
                  for (var index = 0; index < stories.length; index++) ...[
                    LocalNewsItemCard(story: stories[index], index: index + 1),
                    if (index != stories.length - 1) const SizedBox(height: 14),
                  ],
                ],
              ),
            ],
          );

          final sideInfo = _buildSideInfoPanel(
            quote: section.quote.quote,
            metrics: section.highlights
                .map((metric) => '${metric.label}: ${metric.value}')
                .toList(),
          );

          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 11, child: content),
                    const SizedBox(width: 22),
                    Expanded(flex: 4, child: sideInfo),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [content, const SizedBox(height: 18), sideInfo],
                );
        },
      ),
    );
  }

  Widget _buildLocalHero(String title, String location) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFD7DEE8), Color(0xFFF5F7FA)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.location_city_outlined,
                      size: 92,
                      color: AppColors.steelGray,
                    ),
                  ),
                  Positioned(
                    left: 18,
                    top: 18,
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
                        'صورة بانورامية للمحافظة',
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
          Text(title, style: AppTextStyles.pageTitle),
          const SizedBox(height: 8),
          Text(location, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

Widget _buildSideInfoPanel({
  required String quote,
  required List<String> metrics,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.midnightBlue,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ملاحظات المكتب المحلي',
          style: AppTextStyles.sectionTitle.copyWith(
            color: AppColors.paperWhite,
          ),
        ),
        const SizedBox(height: 16),
        for (final item in metrics)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              item,
              style: AppTextStyles.body.copyWith(
                color: AppColors.paperWhite.withValues(alpha: 0.9),
              ),
            ),
          ),
        const Divider(color: AppColors.paperWhite),
        const SizedBox(height: 12),
        Text(
          'التركيز التحريري',
          style: AppTextStyles.bodyStrong.copyWith(color: AppColors.paperWhite),
        ),
        const SizedBox(height: 10),
        Text(
          quote,
          style: AppTextStyles.body.copyWith(
            color: AppColors.paperWhite.withValues(alpha: 0.9),
          ),
        ),
      ],
    ),
  );
}
