import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';
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
      subtitle: 'لوحة عالمية متعددة الطبقات مع تحديثات جانبية',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1020;
          final mainList = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom3dReveal(child: const _WorldMapBanner()),
              const SizedBox(height: 24),
              const Custom3dSectionHeader(
                eyebrow: 'العناوين الدولية',
                title: 'القصص العابرة للمكاتب',
                subtitle:
                    'مكدس عالمي من البطاقات الإخبارية ذات عمق خفيف وخلفية مستوحاة من خريطة العالم.',
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  for (var index = 0; index < stories.length; index++) ...[
                    Custom3dReveal(
                      delay: Duration(milliseconds: 80 + (index * 40)),
                      child: _HeadlineTile(
                        story: stories[index],
                        index: index + 1,
                      ),
                    ),
                    if (index != stories.length - 1) const SizedBox(height: 14),
                  ],
                ],
              ),
            ],
          );

          final statsPanel = Custom3dReveal(
            delay: const Duration(milliseconds: 140),
            child: _StatsPanel(
              metrics: section.highlights,
              updates: section.tickerItems,
            ),
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
}

class _WorldMapBanner extends StatelessWidget {
  const _WorldMapBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: App3dStyles.panelDecoration(tone: App3dTone.dark, radius: 30),
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: Stack(
          children: [
            Positioned(
              top: 18,
              left: 18,
              child: const Custom3dBadge(
                label: 'خلفية عالمية',
                icon: Icons.language_outlined,
                backgroundColor: Color(0x22FFFFFF),
                foregroundColor: AppColors.paperWhite,
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
          ],
        ),
      ),
    );
  }
}

class _HeadlineTile extends StatelessWidget {
  const _HeadlineTile({required this.story, required this.index});

  final ProgramStory story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.surface,
        radius: 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom3dBadge(
            label: '$index',
            backgroundColor: AppColors.midnightBlue,
            foregroundColor: AppColors.paperWhite,
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
                  '${story.location} | ${story.category}',
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsPanel extends StatelessWidget {
  const _StatsPanel({required this.metrics, required this.updates});

  final List<ProgramMetric> metrics;
  final List<String> updates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < metrics.length; index++) ...[
          Custom3dStatBox(
            label: metrics[index].label,
            value: metrics[index].value,
            caption: metrics[index].caption,
            tone: index == 1 ? App3dTone.dark : App3dTone.surface,
          ),
          const SizedBox(height: 16),
        ],
        Container(
          padding: const EdgeInsets.all(20),
          decoration: App3dStyles.panelDecoration(
            tone: App3dTone.glass,
            radius: 26,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Custom3dSectionHeader(
                eyebrow: 'تحديثات عاجلة',
                title: 'حركة المكاتب',
                subtitle:
                    'خلاصة سريعة من الشبكة الدولية داخل لوحة جانبية مرتفعة.',
              ),
              const SizedBox(height: 14),
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
        ),
      ],
    );
  }
}
