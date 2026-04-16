import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/data/models/economy_model.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/modules/economy/controllers/economy_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class EconomyView extends GetView<EconomyController> {
  const EconomyView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;

    return ProgramShell(
      title: 'الاقتصاد',
      subtitle: 'شاشة مالية متكاملة للمؤشرات والعملات والمعادن والطاقة.',
      tickerItems: section.tickerItems,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 18,
            runSpacing: 18,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              _buildChartPlaceholder(
                title: 'اتجاهات السوق',
                subtitle: 'مساحة مخصصة للرسم البياني الرئيسي',
                icon: Icons.show_chart_outlined,
              ),
              _buildChartPlaceholder(
                title: 'قراءة السيولة',
                subtitle: 'مساحة مخصصة للرسم البياني الثانوي',
                icon: Icons.bar_chart_outlined,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('بطاقات السوق', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 14),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: controller.economyItems
                .map((item) => _buildMarketCard(item))
                .toList(),
          ),
          const SizedBox(height: 24),
          Text('العملات والذهب والنفط', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 14),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: [
              ...controller.currencyRates.map(
                (item) => _buildEconomyInfoBox(
                  label: item.title,
                  value: item.value,
                  details: item.analysis,
                ),
              ),
              _buildEconomyInfoBox(
                label: controller.goldPrice.title,
                value: controller.goldPrice.value,
                details: controller.goldPrice.analysis,
              ),
              _buildEconomyInfoBox(
                label: controller.oilPrice.title,
                value: controller.oilPrice.value,
                details: controller.oilPrice.analysis,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.paperWhite,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderGray),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('خلاصة التحليل المالي', style: AppTextStyles.sectionTitle),
                const SizedBox(height: 14),
                Text(
                  controller.financialAnalysis.analysis,
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 18,
                  runSpacing: 18,
                  children: section.highlights
                      .map((metric) => _buildMetricStrip(metric))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartPlaceholder({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      width: 420,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.midnightBlue, AppColors.studioBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.sectionTitle.copyWith(
              color: AppColors.paperWhite,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: AppTextStyles.caption.copyWith(color: AppColors.softGray),
          ),
          const SizedBox(height: 20),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.paperWhite.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                for (final left in [46.0, 118.0, 190.0, 262.0, 334.0])
                  Positioned(
                    left: left,
                    bottom: 20,
                    child: Container(
                      width: 24,
                      height: 44 + (left / 4),
                      decoration: BoxDecoration(
                        color: AppColors.paperWhite.withValues(alpha: 0.28),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                Center(
                  child: Icon(icon, size: 58, color: AppColors.paperWhite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMarketCard(EconomyModel item) {
  return Container(
    constraints: const BoxConstraints(minWidth: 280, maxWidth: 390),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 8,
          children: [
            Text(
              item.market,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.broadcastRed,
              ),
            ),
            Text(item.publishTime, style: AppTextStyles.caption),
          ],
        ),
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.ivory,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(item.change, style: AppTextStyles.caption),
        ),
      ],
    ),
  );
}

Widget _buildMetricStrip(ProgramMetric metric) {
  return Container(
    width: 230,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.ivory,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(metric.label, style: AppTextStyles.caption),
        const SizedBox(height: 8),
        Text(metric.value, style: AppTextStyles.headline),
        const SizedBox(height: 8),
        Text(metric.caption, style: AppTextStyles.body),
      ],
    ),
  );
}

Widget _buildEconomyInfoBox({
  required String label,
  required String value,
  required String details,
}) {
  return Container(
    width: 250,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.caption),
        const SizedBox(height: 8),
        Text(value, style: AppTextStyles.headline),
        const SizedBox(height: 8),
        Text(details, style: AppTextStyles.body),
      ],
    ),
  );
}
