import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/core/responsive/responsive_layout.dart';
import 'package:newscope/modules/home/controllers/home_controller.dart';
import 'package:newscope/shared/widgets/custom_news_card.dart';
import 'package:newscope/shared/widgets/custom_section_title.dart';
import 'package:newscope/shared/widgets/custom_stat_box.dart';
import 'package:newscope/shared/widgets/dashboard_nav_card.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = ResponsiveLayout.sectionGap(context);
    final columns = ResponsiveLayout.navigationColumns(context);

    return ProgramShell(
      title: 'News Dashboard',
      subtitle: 'Central navigation for the classic news programme layout.',
      tickerItems: controller.tickerItems,
      showHomeAction: false,
      showBackAction: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.studioBlue, AppColors.midnightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A formal, responsive control room for every bulletin block.',
                  style: AppTextStyles.pageTitle.copyWith(
                    color: AppColors.paperWhite,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  controller.editorialQuote.quote,
                  style: AppTextStyles.body.copyWith(color: AppColors.softGray),
                ),
                const SizedBox(height: 18),
                Text(
                  '${controller.editorialQuote.speaker} • ${controller.editorialQuote.role}',
                  style: AppTextStyles.meta.copyWith(
                    color: AppColors.paperWhite,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: gap),
          const CustomSectionTitle(
            title: 'Programme Line-Up',
            subtitle:
                'Every requested page is linked here through named GetX routes.',
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final cardWidth = columns == 1
                  ? width
                  : (width - ((columns - 1) * 16)) / columns;

              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: controller.destinations
                    .map(
                      (destination) => SizedBox(
                        width: cardWidth,
                        height: 240,
                        child: DashboardNavCard(
                          destination: destination,
                          onTap: () => controller.openRoute(destination.route),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          SizedBox(height: gap),
          const CustomSectionTitle(
            title: 'Featured Desk Briefs',
            subtitle:
                'Selected placeholder stories that shape the dashboard tone.',
          ),
          const SizedBox(height: 16),
          for (final story in controller.featuredStories) ...[
            CustomNewsCard(story: story, compact: true),
            const SizedBox(height: 16),
          ],
          SizedBox(height: gap),
          const CustomSectionTitle(
            title: 'Control Room Metrics',
            subtitle:
                'Static briefing values shown in a broadcast-style layout.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: controller.metrics
                .map((metric) => CustomStatBox(metric: metric))
                .toList(),
          ),
        ],
      ),
    );
  }
}
