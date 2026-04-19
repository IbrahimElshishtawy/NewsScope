import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_media_frame.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/modules/report/controllers/report_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = controller.reports;
    final leadReport = reports.first;
    final sideReports = reports.skip(1).toList(growable: false);

    return ProgramShell(
      title: 'التقرير الخاص',
      subtitle: 'معالجة تحليلية بهوية رسمية وتوزيع أخف للمحتوى',
      tickerItems: controller.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1020;
          final cardWidth = isWide
              ? 340.0
              : constraints.maxWidth.clamp(0.0, 520.0).toDouble();

          final mainColumn = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom3dReveal(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: App3dStyles.panelDecoration(
                    tone: App3dTone.surface,
                    radius: 28,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            const Custom3dBadge(
                              label: 'تقرير ميداني',
                              icon: Icons.ondemand_video_outlined,
                              backgroundColor: Color(0x14C62828),
                              foregroundColor: AppColors.broadcastRed,
                            ),
                            Text(
                              '${leadReport.location} | ${leadReport.publishTime}',
                              style: AppTextStyles.cardMeta,
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        LayoutBuilder(
                          builder: (context, sectionConstraints) {
                            final showOverlayCard =
                                sectionConstraints.maxWidth >= 620;

                            return Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: showOverlayCard ? 12 : 0,
                                    left: showOverlayCard ? 12 : 0,
                                  ),
                                  child: Custom3dMediaFrame(
                                    title: leadReport.title,
                                    subtitle: leadReport.description,
                                    icon: Icons.ondemand_video_outlined,
                                    badge: 'مادة التقرير',
                                    footer: 'المراسل: ${leadReport.reporter}',
                                    tone: App3dTone.dark,
                                  ),
                                ),
                                if (showOverlayCard)
                                  PositionedDirectional(
                                    top: 0,
                                    start: 0,
                                    child: Container(
                                      width: 190,
                                      padding: const EdgeInsets.all(14),
                                      decoration: App3dStyles.panelDecoration(
                                        tone: App3dTone.glass,
                                        radius: 20,
                                      ),
                                      child: Text(
                                        'زاوية سريعة تبرز قيمة التقرير وتبقي العنوان التحليلي حاضرًا دون حجز مساحة كبيرة.',
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.cardBody.copyWith(
                                          color: AppColors.paperWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          leadReport.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.cardTitle,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          leadReport.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.cardBody,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Custom3dReveal(
                delay: const Duration(milliseconds: 100),
                child: const Custom3dSectionHeader(
                  eyebrow: 'امتدادات ميدانية',
                  title: 'تقارير مرتبطة',
                  subtitle:
                      'بطاقات جانبية أخف تكمل الملف الميداني وتوزع المعلومات على طبقات واضحة.',
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: [
                  for (var index = 0; index < sideReports.length; index++)
                    SizedBox(
                      width: cardWidth,
                      child: Custom3dReveal(
                        delay: Duration(milliseconds: 140 + (index * 40)),
                        child: _FieldNoteCard(
                          title: sideReports[index].title,
                          category: sideReports[index].category,
                          description: sideReports[index].description,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );

          final sidePanel = Column(
            children: [
              Custom3dReveal(
                delay: const Duration(milliseconds: 120),
                child: _HighlightsPanel(highlights: leadReport.highlights),
              ),
              const SizedBox(height: 16),
              Custom3dReveal(
                delay: const Duration(milliseconds: 180),
                child: Custom3dQuoteBox(
                  quote: controller.section.quote.quote,
                  speaker: controller.section.quote.speaker,
                  role: controller.section.quote.role,
                  tone: App3dTone.glass,
                ),
              ),
            ],
          );

          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 12, child: mainColumn),
                    const SizedBox(width: 18),
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
}

class _FieldNoteCard extends StatelessWidget {
  const _FieldNoteCard({
    required this.title,
    required this.category,
    required this.description,
  });

  final String title;
  final String category;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.surface,
        radius: 22,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom3dBadge(
              label: category,
              backgroundColor: AppColors.broadcastRed.withValues(alpha: 0.10),
              foregroundColor: AppColors.broadcastRed,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.cardTitleSecondary,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.cardBody,
            ),
          ],
        ),
      ),
    );
  }
}

class _HighlightsPanel extends StatelessWidget {
  const _HighlightsPanel({required this.highlights});

  final List<String> highlights;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: App3dStyles.panelDecoration(tone: App3dTone.dark, radius: 26),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Custom3dSectionHeader(
              eyebrow: 'بطاقات حقائق',
              title: 'حقائق وإضاءات',
              subtitle: 'نقاط مختصرة إلى جانب التقرير لزيادة الوضوح التحليلي.',
            ),
            const SizedBox(height: 14),
            for (final item in highlights)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Text(
                    item,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardBody.copyWith(
                      color: AppColors.paperWhite,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
