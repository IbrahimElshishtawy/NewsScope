import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_media_frame.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';
import 'package:newscope/modules/local_news/controllers/local_news_controller.dart';
import 'package:newscope/modules/local_news/views/local_news_item_card.dart';
import 'package:newscope/shared/widgets/program_shell.dart';

class LocalNewsView extends GetView<LocalNewsController> {
  const LocalNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final stories = [section.leadStory, ...section.sideStories];

    return ProgramShell(
      title: 'أخبار محلية',
      subtitle: 'بطاقات مكدسة ولوحة جانبية للملاحظات السريعة',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1020;

          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom3dReveal(
                child: Custom3dMediaFrame(
                  title: section.leadStory.title,
                  subtitle: section.leadStory.summary,
                  icon: Icons.location_city_outlined,
                  badge: 'المشهد المحلي',
                  footer: section.leadStory.location,
                  tone: App3dTone.surface,
                ),
              ),
              const SizedBox(height: 24),
              const Custom3dSectionHeader(
                eyebrow: 'النشرة المحلية',
                title: 'القصص الرئيسية',
                subtitle:
                    'ترتيب القصص المحلية داخل بطاقات متتابعة تمنح إحساس غرفة متابعة ميدانية.',
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  for (var index = 0; index < stories.length; index++) ...[
                    Custom3dReveal(
                      delay: Duration(milliseconds: 80 + (index * 40)),
                      child: LocalNewsItemCard(
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

          final sideInfo = Column(
            children: [
              Custom3dReveal(
                delay: const Duration(milliseconds: 140),
                child: Custom3dQuoteBox(
                  quote: section.quote.quote,
                  speaker: section.quote.speaker,
                  role: section.quote.role,
                  tone: App3dTone.dark,
                ),
              ),
              const SizedBox(height: 18),
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
                      delay: Duration(milliseconds: 180 + (index * 40)),
                      child: Custom3dStatBox(
                        label: section.highlights[index].label,
                        value: section.highlights[index].value,
                        caption: section.highlights[index].caption,
                        tone: index == 1 ? App3dTone.glass : App3dTone.surface,
                      ),
                    ),
                ],
              ),
            ],
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
}
