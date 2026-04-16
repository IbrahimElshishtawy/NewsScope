import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/modules/economy/controllers/economy_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class EconomyView extends GetView<EconomyController> {
  const EconomyView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final stories = [section.leadStory, ...section.sideStories];

    return ProgramShell(
      title: 'الاقتصاد',
      subtitle: 'Serious market coverage with structured analysis panels',
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
                title: 'Inflation trajectory',
                subtitle: 'Primary chart placeholder',
                icon: Icons.show_chart_outlined,
              ),
              _buildChartPlaceholder(
                title: 'Liquidity demand',
                subtitle: 'Secondary chart placeholder',
                icon: Icons.bar_chart_outlined,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Market cards', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 14),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: stories.map((story) => _buildMarketCard(story)).toList(),
          ),
          const SizedBox(height: 24),
          Text('Currency, gold, and oil', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 14),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: [
              _buildEconomyInfoBox(
                label: 'Currency',
                value: 'Desk feed',
                details: 'Official FX board placeholder',
              ),
              _buildEconomyInfoBox(
                label: 'Gold',
                value: 'Live board',
                details: 'Metals update placeholder',
              ),
              _buildEconomyInfoBox(
                label: 'Oil',
                value: 'Energy feed',
                details: 'Crude benchmark placeholder',
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
                Text('Summary analysis', style: AppTextStyles.sectionTitle),
                const SizedBox(height: 14),
                Text(section.leadStory.summary, style: AppTextStyles.body),
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

Widget _buildMarketCard(ProgramStory story) {
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
        Text(
          story.category.toUpperCase(),
          style: AppTextStyles.caption.copyWith(color: AppColors.broadcastRed),
        ),
        const SizedBox(height: 8),
        Text(story.title, style: AppTextStyles.bodyStrong),
        const SizedBox(height: 10),
        Text(story.summary, style: AppTextStyles.body),
        const SizedBox(height: 10),
        Text(story.focus, style: AppTextStyles.caption),
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
