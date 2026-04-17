import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_media_frame.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/modules/quotes/controllers/quotes_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class QuotesView extends GetView<QuotesController> {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = controller.quotes;
    final official = quotes.first;
    final secondaryQuotes = quotes.skip(1).toList(growable: false);

    return ProgramShell(
      title: 'الاقتباسات',
      subtitle: 'تصريحات محورية داخل صناديق عائمة وإطارات مرتفعة',
      tickerItems: controller.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom3dReveal(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: App3dStyles.panelDecoration(
                    tone: App3dTone.surface,
                    radius: 30,
                  ),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Custom3dMediaFrame(
                                title: official.speakerName,
                                subtitle: official.role,
                                icon: Icons.account_circle_outlined,
                                badge: 'صورة المتحدث',
                                footer: official.imageUrl,
                                tone: App3dTone.dark,
                              ),
                            ),
                            const SizedBox(width: 22),
                            Expanded(
                              flex: 7,
                              child: Custom3dQuoteBox(
                                quote: official.quoteText,
                                speaker: official.speakerName,
                                role: official.role,
                                source:
                                    '${official.source} | ${official.publishTime}',
                                tone: App3dTone.dark,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Custom3dMediaFrame(
                              title: official.speakerName,
                              subtitle: official.role,
                              icon: Icons.account_circle_outlined,
                              badge: 'صورة المتحدث',
                              footer: official.imageUrl,
                              tone: App3dTone.dark,
                            ),
                            const SizedBox(height: 20),
                            Custom3dQuoteBox(
                              quote: official.quoteText,
                              speaker: official.speakerName,
                              role: official.role,
                              source:
                                  '${official.source} | ${official.publishTime}',
                              tone: App3dTone.dark,
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 24),
              Custom3dReveal(
                delay: const Duration(milliseconds: 100),
                child: const Custom3dSectionHeader(
                  eyebrow: 'تصريحات إضافية',
                  title: 'سياقات مصاحبة',
                  subtitle:
                      'بطاقات اقتباس ثانوية معلقة داخل واجهة ذات عمق خفيف للحفاظ على التسلسل البصري.',
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  for (var index = 0; index < secondaryQuotes.length; index++)
                    SizedBox(
                      width: 360,
                      child: Custom3dReveal(
                        delay: Duration(milliseconds: 140 + (index * 40)),
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: App3dStyles.panelDecoration(
                            tone: App3dTone.surface,
                            radius: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                secondaryQuotes[index].topic,
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.broadcastRed,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                secondaryQuotes[index].speakerName,
                                style: AppTextStyles.bodyStrong,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                secondaryQuotes[index].role,
                                style: AppTextStyles.caption,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                secondaryQuotes[index].quoteText,
                                style: AppTextStyles.body,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${secondaryQuotes[index].source} | ${secondaryQuotes[index].publishTime}',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.steelGray,
                                ),
                              ),
                            ],
                          ),
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
