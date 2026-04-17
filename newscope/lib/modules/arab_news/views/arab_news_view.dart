import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';
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
      subtitle: 'تصميم إقليمي بطبقات خريطة ومؤشرات عائمة',
      tickerItems: section.tickerItems,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom3dReveal(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: App3dStyles.panelDecoration(
                tone: App3dTone.dark,
                radius: 30,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 980;

                  final mapPanel = _RegionalMapPanel();
                  final leadCard = _LeadStoryCard(story: section.leadStory);

                  return isWide
                      ? Row(
                          children: [
                            Expanded(flex: 6, child: mapPanel),
                            const SizedBox(width: 22),
                            Expanded(flex: 7, child: leadCard),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            mapPanel,
                            const SizedBox(height: 18),
                            leadCard,
                          ],
                        );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Custom3dSectionHeader(
            eyebrow: 'القصص الإقليمية',
            title: 'واجهة القصص العربية',
            subtitle:
                'قصص عائمة بخط بصري موحد يربط بين العاصمة والخلفية التحليلية داخل مشهد أنيق.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (var index = 0; index < featuredStories.length; index++)
                SizedBox(
                  width: 360,
                  child: Custom3dReveal(
                    delay: Duration(milliseconds: 80 + (index * 40)),
                    child: _RegionalStoryCard(story: featuredStories[index]),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Custom3dReveal(
            delay: const Duration(milliseconds: 180),
            child: Custom3dQuoteBox(
              quote: section.quote.quote,
              speaker: section.quote.speaker,
              role: section.quote.role,
              tone: App3dTone.glass,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (var index = 0; index < section.highlights.length; index++)
                Custom3dReveal(
                  delay: Duration(milliseconds: 220 + (index * 40)),
                  child: Custom3dStatBox(
                    label: section.highlights[index].label,
                    value: section.highlights[index].value,
                    caption: section.highlights[index].caption,
                    tone: index == 0 ? App3dTone.dark : App3dTone.surface,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RegionalMapPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 320),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.white.withValues(alpha: 0.06),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: const Custom3dBadge(
              label: 'الخريطة الإقليمية',
              icon: Icons.public_outlined,
              backgroundColor: Color(0x22FFFFFF),
              foregroundColor: AppColors.paperWhite,
            ),
          ),
          const Center(
            child: Icon(
              Icons.public_outlined,
              size: 92,
              color: AppColors.paperWhite,
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
}

class _LeadStoryCard extends StatelessWidget {
  const _LeadStoryCard({required this.story});

  final ProgramStory story;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.surface,
        radius: 26,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom3dBadge(
            label: story.category,
            backgroundColor: AppColors.broadcastRed.withValues(alpha: 0.10),
            foregroundColor: AppColors.broadcastRed,
          ),
          const SizedBox(height: 10),
          Text(story.title, style: AppTextStyles.pageTitle),
          const SizedBox(height: 12),
          Text(story.summary, style: AppTextStyles.body),
          const SizedBox(height: 14),
          Text(
            '${story.location} | ${story.reporter}',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}

class _RegionalStoryCard extends StatelessWidget {
  const _RegionalStoryCard({required this.story});

  final ProgramStory story;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.surface,
        radius: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.focus,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.broadcastRed,
            ),
          ),
          const SizedBox(height: 8),
          Text(story.title, style: AppTextStyles.bodyStrong),
          const SizedBox(height: 10),
          Text(story.summary, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
