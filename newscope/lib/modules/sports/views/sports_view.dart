import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_media_frame.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/modules/sports/controllers/sports_controller.dart';
import 'package:newscope/modules/sports/widgets/match_result_card.dart';
import 'package:newscope/modules/sports/widgets/score_box.dart';
import 'package:newscope/shared/widgets/program_shell.dart';

class SportsView extends GetView<SportsController> {
  const SportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgramShell(
      title: controller.title,
      subtitle: 'ملف رياضي بطاقاتُه أخف وأكثر وضوحًا على الشاشات الصغيرة',
      tickerItems: controller.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 960;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom3dReveal(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: App3dStyles.panelDecoration(
                    tone: App3dTone.dark,
                    radius: 28,
                  ),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 8,
                              child: Custom3dMediaFrame(
                                title: controller.section.leadStory.title,
                                subtitle: controller.section.leadStory.summary,
                                icon: Icons.emoji_events_rounded,
                                badge: 'الواجهة الرياضية',
                                footer: controller.section.leadStory.category,
                                tone: App3dTone.surface,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              flex: 5,
                              child: Custom3dQuoteBox(
                                quote: controller.section.quote.quote,
                                speaker: controller.section.quote.speaker,
                                role: controller.section.quote.role,
                                tone: App3dTone.glass,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Custom3dMediaFrame(
                              title: controller.section.leadStory.title,
                              subtitle: controller.section.leadStory.summary,
                              icon: Icons.emoji_events_rounded,
                              badge: 'الواجهة الرياضية',
                              footer: controller.section.leadStory.category,
                              tone: App3dTone.surface,
                            ),
                            const SizedBox(height: 16),
                            Custom3dQuoteBox(
                              quote: controller.section.quote.quote,
                              speaker: controller.section.quote.speaker,
                              role: controller.section.quote.role,
                              tone: App3dTone.glass,
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 22),
              const Custom3dSectionHeader(
                eyebrow: 'نتائج المباريات',
                title: 'لوحة المباريات',
                subtitle:
                    'نتائج مختصرة داخل بطاقات أكثر اتزانًا تمنع تكدس أسماء الفرق والنتيجة.',
              ),
              const SizedBox(height: 14),
              ...controller.matches.map(
                (match) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: MatchResultCard(
                    competition: match.competition,
                    homeTeam: match.homeTeam,
                    awayTeam: match.awayTeam,
                    score: match.score,
                    status: match.status,
                    icon: match.icon,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Custom3dSectionHeader(
                eyebrow: 'المؤشرات والترتيب',
                title: 'لوحات الأداء',
                subtitle:
                    'صناديق قصيرة المدى تمنح القسم الرياضي معلومات واضحة دون تضخم في النصوص.',
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: controller.scoreBoxes
                    .map(
                      (metric) => ScoreBox(
                        label: metric.label,
                        value: metric.value,
                        caption: metric.caption,
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
