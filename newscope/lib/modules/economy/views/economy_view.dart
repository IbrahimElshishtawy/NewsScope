import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/data/models/economy_model.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_chart_panel.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';
import 'package:newscope/modules/economy/controllers/economy_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_text_styles.dart';

class EconomyView extends GetView<EconomyController> {
  const EconomyView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;

    return ProgramShell(
      title: 'الاقتصاد',
      subtitle: 'شاشة مالية ثلاثية الأبعاد بمؤشرات ولوحات تحليل مرتفعة',
      tickerItems: section.tickerItems,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              const SizedBox(
                width: 420,
                child: Custom3dChartPanel(
                  title: 'اتجاهات السوق',
                  subtitle: 'لوحة رئيسية تعرض المسار العام للمؤشرات المالية.',
                  icon: Icons.show_chart_outlined,
                ),
              ),
              const SizedBox(
                width: 420,
                child: Custom3dChartPanel(
                  title: 'قراءة السيولة',
                  subtitle: 'إطار ثانوي لتحليل النشاط والسيولة وتوزيع الحركة.',
                  icon: Icons.bar_chart_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Custom3dSectionHeader(
            eyebrow: 'بطاقات السوق',
            title: 'المؤشرات والمحركات',
            subtitle:
                'عرض المؤشرات الرئيسية داخل بطاقات مرتفعة بخط بصري يحاكي شاشات الاقتصاد التلفزيونية.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (
                var index = 0;
                index < controller.economyItems.length;
                index++
              )
                SizedBox(
                  width: 360,
                  child: Custom3dReveal(
                    delay: Duration(milliseconds: 80 + (index * 30)),
                    child: _MarketCard(item: controller.economyItems[index]),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          const Custom3dSectionHeader(
            eyebrow: 'سلع وعملات',
            title: 'العملات والذهب والطاقة',
            subtitle:
                'قراءات قصيرة داخل صناديق عائمة تمنح لوحات السوق إيقاعاً واضحاً ومتوازناً.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (final item in [
                ...controller.currencyRates,
                controller.goldPrice,
                controller.oilPrice,
              ])
                Custom3dStatBox(
                  label: item.title,
                  value: item.value,
                  caption: item.analysis,
                  tone: item.type == 'oil' ? App3dTone.dark : App3dTone.surface,
                ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: App3dStyles.panelDecoration(
              tone: App3dTone.glass,
              radius: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Custom3dSectionHeader(
                  eyebrow: 'خلاصة مالية',
                  title: 'القراءة النهائية',
                  subtitle:
                      'ملخص تحليلي داخل حاوية زجاجية يعزز إحساس غرفة بيانات اقتصادية متقدمة.',
                ),
                const SizedBox(height: 14),
                Text(
                  controller.financialAnalysis.analysis,
                  style: AppTextStyles.body,
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
                      Custom3dStatBox(
                        label: section.highlights[index].label,
                        value: section.highlights[index].value,
                        caption: section.highlights[index].caption,
                        tone: index == 1 ? App3dTone.dark : App3dTone.surface,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MarketCard extends StatelessWidget {
  const _MarketCard({required this.item});

  final EconomyModel item;

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
          Text(item.market, style: AppTextStyles.caption),
          const SizedBox(height: 8),
          Text(item.title, style: AppTextStyles.bodyStrong),
          const SizedBox(height: 10),
          Text(
            item.value,
            style: AppTextStyles.pageTitle.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 10),
          Text(item.analysis, style: AppTextStyles.body),
          const SizedBox(height: 10),
          Text(item.change, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
