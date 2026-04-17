import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_media_frame.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';
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
      subtitle: 'الملف الأبرز داخل مشهد بصري مرتفع الطبقات',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1040;

          final hero = Container(
            width: double.infinity,
            decoration: App3dStyles.panelDecoration(
              tone: App3dTone.dark,
              radius: 32,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 11,
                          child: _HeroCopy(
                            story: leadStory,
                            bulletPoints: mainNews.bulletPoints,
                          ),
                        ),
                        const SizedBox(width: 22),
                        Expanded(
                          flex: 9,
                          child: Custom3dMediaFrame(
                            title: 'إطار القصة الرئيسية',
                            subtitle: leadStory.summary,
                            icon: Icons.perm_media_outlined,
                            badge: 'العنوان الأبرز',
                            footer: 'المتابعة من ${leadStory.location}',
                            tone: App3dTone.surface,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _HeroCopy(
                          story: leadStory,
                          bulletPoints: mainNews.bulletPoints,
                        ),
                        const SizedBox(height: 20),
                        Custom3dMediaFrame(
                          title: 'إطار القصة الرئيسية',
                          subtitle: leadStory.summary,
                          icon: Icons.perm_media_outlined,
                          badge: 'العنوان الأبرز',
                          footer: 'المتابعة من ${leadStory.location}',
                          tone: App3dTone.surface,
                        ),
                      ],
                    ),
            ),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom3dReveal(child: hero),
              const SizedBox(height: 24),
              Custom3dReveal(
                delay: const Duration(milliseconds: 80),
                child: const Custom3dSectionHeader(
                  eyebrow: 'لوحة المؤشرات',
                  title: 'مؤشرات الملف الرئيسي',
                  subtitle:
                      'بطاقات مرتفعة تبرز أبعاد المتابعة التنفيذية والزمنية داخل الخبر الأبرز.',
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  for (
                    var index = 0;
                    index < section.highlights.length;
                    index++
                  )
                    Custom3dReveal(
                      delay: Duration(milliseconds: 120 + (index * 40)),
                      child: Custom3dStatBox(
                        label: section.highlights[index].label,
                        value: section.highlights[index].value,
                        caption: section.highlights[index].caption,
                        tone: index == 1 ? App3dTone.dark : App3dTone.surface,
                        icon: index == 0
                            ? Icons.track_changes_outlined
                            : index == 1
                            ? Icons.timer_outlined
                            : Icons.account_tree_outlined,
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
              Custom3dReveal(
                delay: const Duration(milliseconds: 220),
                child: const Custom3dSectionHeader(
                  eyebrow: 'مسارات مساندة',
                  title: 'التغطية المتفرعة',
                  subtitle:
                      'قصص دعم مرتبة كبطاقات معلقة لإبراز الامتدادات التحريرية للملف الرئيسي.',
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  for (
                    var index = 0;
                    index < section.sideStories.length;
                    index++
                  )
                    SizedBox(
                      width: 360,
                      child: Custom3dReveal(
                        delay: Duration(milliseconds: 260 + (index * 40)),
                        child: _SupportingStoryCard(
                          story: section.sideStories[index],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.story, required this.bulletPoints});

  final ProgramStory story;
  final List<String> bulletPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            const Custom3dBadge(
              label: 'الملف الأبرز',
              icon: Icons.campaign_outlined,
              backgroundColor: Color(0x22FFFFFF),
              foregroundColor: AppColors.paperWhite,
            ),
            Custom3dBadge(
              label: story.category,
              backgroundColor: Colors.white.withValues(alpha: 0.08),
              foregroundColor: AppColors.paperWhite,
            ),
            Custom3dBadge(
              label: story.timeLabel,
              backgroundColor: Colors.white.withValues(alpha: 0.08),
              foregroundColor: AppColors.paperWhite,
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          story.title,
          style: AppTextStyles.pageTitle.copyWith(
            color: AppColors.paperWhite,
            fontSize: 36,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          story.summary,
          style: AppTextStyles.body.copyWith(
            color: AppColors.softGray,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white.withValues(alpha: 0.06),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نقاط المتابعة الأساسية',
                style: AppTextStyles.bodyStrong.copyWith(
                  color: AppColors.paperWhite,
                ),
              ),
              const SizedBox(height: 14),
              for (final item in bulletPoints)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: AppColors.broadcastRed,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.paperWhite,
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
}

class _SupportingStoryCard extends StatelessWidget {
  const _SupportingStoryCard({required this.story});

  final ProgramStory story;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.surface,
        radius: 26,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Custom3dBadge(
                label: story.category,
                backgroundColor: AppColors.broadcastRed.withValues(alpha: 0.10),
                foregroundColor: AppColors.broadcastRed,
              ),
              Custom3dBadge(label: story.timeLabel),
            ],
          ),
          const SizedBox(height: 12),
          Text(story.title, style: AppTextStyles.sectionTitle),
          const SizedBox(height: 10),
          Text(story.summary, style: AppTextStyles.body),
          const SizedBox(height: 12),
          Text(
            '${story.location} | ${story.reporter}',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}
