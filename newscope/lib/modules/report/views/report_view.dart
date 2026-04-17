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
      subtitle: 'معالجة بصرية تحليلية تشبه غرفة تقارير ميدانية',
      tickerItems: controller.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1020;

          final mainColumn = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom3dReveal(
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: App3dStyles.panelDecoration(
                    tone: App3dTone.surface,
                    radius: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Custom3dBadge(
                            label: 'تقرير ميداني',
                            icon: Icons.ondemand_video_outlined,
                            backgroundColor: Color(0x14C62828),
                            foregroundColor: AppColors.broadcastRed,
                          ),
                          const Spacer(),
                          Text(
                            '${leadReport.location} | ${leadReport.publishTime}',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        children: [
                          Custom3dMediaFrame(
                            title: leadReport.title,
                            subtitle: leadReport.description,
                            icon: Icons.ondemand_video_outlined,
                            badge: 'مادة التقرير',
                            footer: 'المراسل: ${leadReport.reporter}',
                            tone: App3dTone.dark,
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: Transform(
                              alignment: Alignment.center,
                              transform: App3dStyles.tiltedMatrix(
                                rotateY: -0.08,
                                rotateX: 0.03,
                              ),
                              child: Container(
                                width: 180,
                                padding: const EdgeInsets.all(14),
                                decoration: App3dStyles.panelDecoration(
                                  tone: App3dTone.glass,
                                  radius: 22,
                                ),
                                child: Text(
                                  'عنوان تحليلي معلق فوق الإطار الرئيسي لإبراز قيمة التقرير داخل المشهد.',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.paperWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(leadReport.title, style: AppTextStyles.pageTitle),
                      const SizedBox(height: 10),
                      Text(leadReport.description, style: AppTextStyles.body),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Custom3dReveal(
                delay: const Duration(milliseconds: 100),
                child: const Custom3dSectionHeader(
                  eyebrow: 'امتدادات ميدانية',
                  title: 'تقارير مرتبطة',
                  subtitle:
                      'بطاقات جانبية مرتفعة لتكملة الملف الميداني وتوزيع المعلومات على طبقات مستقلة.',
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  for (var index = 0; index < sideReports.length; index++)
                    SizedBox(
                      width: 360,
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
              const SizedBox(height: 18),
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
                    const SizedBox(width: 22),
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
      padding: const EdgeInsets.all(18),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.surface,
        radius: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom3dBadge(
            label: category,
            backgroundColor: AppColors.broadcastRed.withValues(alpha: 0.10),
            foregroundColor: AppColors.broadcastRed,
          ),
          const SizedBox(height: 10),
          Text(title, style: AppTextStyles.bodyStrong),
          const SizedBox(height: 10),
          Text(description, style: AppTextStyles.body),
        ],
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
      padding: const EdgeInsets.all(22),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.dark,
        radius: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Custom3dSectionHeader(
            eyebrow: 'بطاقات حقائق',
            title: 'حقائق وإضاءات',
            subtitle: 'نقاط معلقة إلى جانب التقرير لزيادة الإحساس التحليلي.',
          ),
          const SizedBox(height: 16),
          for (final item in highlights)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                ),
                child: Text(
                  item,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.paperWhite,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
