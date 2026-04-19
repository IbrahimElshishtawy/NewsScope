import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_background.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_ticker.dart';
import 'package:newscope/core/responsive/responsive_layout.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/modules/breaking_news/controllers/breaking_news_controller.dart';
import 'package:newscope/shared/widgets/custom_app_bar.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class BreakingNewsView extends GetView<BreakingNewsController> {
  const BreakingNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final stories = [section.leadStory, ...section.sideStories];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(
          title: 'الأخبار العاجلة',
          subtitle: 'تغطية عاجلة بطابع رسمي واضح وأكثر اتزانًا',
        ),
        body: Custom3dBackground(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 112),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: ResponsiveLayout.maxContentWidth(context),
                      ),
                      child: Padding(
                        padding: ResponsiveLayout.pagePadding(context),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final isWide = constraints.maxWidth >= 980;

                            final liveStack = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Custom3dReveal(child: _UrgentBanner()),
                                const SizedBox(height: 16),
                                Custom3dReveal(
                                  delay: const Duration(milliseconds: 80),
                                  child: Custom3dQuoteBox(
                                    quote: section.quote.quote,
                                    speaker: section.leadStory.title,
                                    role: section.leadStory.summary,
                                    tone: App3dTone.dark,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                const Custom3dSectionHeader(
                                  eyebrow: 'التحديثات المباشرة',
                                  title: 'مكدس الأخبار المؤكدة',
                                  subtitle:
                                      'البطاقات القصيرة تعرض الأخبار العاجلة بطريقة مرتبة وأكثر ملاءمة للشاشات الصغيرة.',
                                ),
                                const SizedBox(height: 14),
                                ...List.generate(stories.length, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: index == stories.length - 1
                                          ? 0
                                          : 12,
                                    ),
                                    child: _LiveItem(
                                      story: stories[index],
                                      index: index + 1,
                                    ),
                                  );
                                }),
                              ],
                            );

                            final sidePanel = Custom3dReveal(
                              delay: const Duration(milliseconds: 120),
                              child: _BreakingPanel(agenda: section.agenda),
                            );

                            return isWide
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(flex: 11, child: liveStack),
                                      const SizedBox(width: 18),
                                      Expanded(flex: 4, child: sidePanel),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      liveStack,
                                      const SizedBox(height: 18),
                                      sidePanel,
                                    ],
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Custom3dTicker(
                  items: section.tickerItems,
                  label: 'عاجل الآن',
                  isUrgent: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UrgentBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.accent,
        radius: 22,
      ),
      child: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: AppColors.paperWhite),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'تحديث عاجل | عرض السطور المؤكدة فقط بعد التحقق التحريري',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.paperWhite,
                fontSize: 12.5,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveItem extends StatelessWidget {
  const _LiveItem({required this.story, required this.index});

  final ProgramStory story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.surface,
        radius: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom3dBadge(
            label: '$index',
            backgroundColor: AppColors.broadcastRed,
            foregroundColor: AppColors.paperWhite,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Custom3dBadge(label: story.category),
                    Custom3dBadge(label: story.timeLabel),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  story.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardTitleSecondary,
                ),
                const SizedBox(height: 6),
                Text(
                  story.summary,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardBody,
                ),
                const SizedBox(height: 8),
                Text(
                  story.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardMeta,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BreakingPanel extends StatelessWidget {
  const _BreakingPanel({required this.agenda});

  final List<String> agenda;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.glass,
        radius: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Custom3dSectionHeader(
            eyebrow: 'أولويات الشريط',
            title: 'مسار التحديث',
            subtitle: 'لوحة جانبية توضح ترتيب السطور العاجلة داخل المشهد.',
          ),
          const SizedBox(height: 14),
          ...agenda.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 9,
                      color: AppColors.broadcastRed,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cardBody.copyWith(
                        color: AppColors.paperWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
