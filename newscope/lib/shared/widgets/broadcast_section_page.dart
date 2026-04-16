import 'package:flutter/material.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/responsive/responsive_layout.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/shared/widgets/broadcast_section_sidebar.dart';
import 'package:newscope/shared/widgets/custom_news_card.dart';
import 'package:newscope/shared/widgets/custom_section_title.dart';
import 'package:newscope/shared/widgets/custom_stat_box.dart';
import 'package:newscope/shared/widgets/custom_weather_card.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class BroadcastSectionPage extends StatelessWidget {
  const BroadcastSectionPage({super.key, required this.section});

  final BroadcastSection section;

  @override
  Widget build(BuildContext context) {
    final gap = ResponsiveLayout.sectionGap(context);

    return ProgramShell(
      title: section.title,
      subtitle: section.strapline,
      tickerItems: section.tickerItems,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.broadcastRed,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              section.bulletinLabel.toUpperCase(),
              style: AppTextStyles.caption.copyWith(
                color: AppColors.paperWhite,
              ),
            ),
          ),
          SizedBox(height: gap),
          CustomNewsCard(story: section.leadStory, featured: true),
          SizedBox(height: gap),
          LayoutBuilder(
            builder: (context, constraints) {
              final useSideBySide = constraints.maxWidth >= 1080;

              if (useSideBySide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: section.sideStories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1.15,
                            ),
                        itemBuilder: (context, index) {
                          return CustomNewsCard(
                            story: section.sideStories[index],
                            compact: true,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: BroadcastSectionSidebar(section: section),
                    ),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: section.sideStories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.2,
                        ),
                    itemBuilder: (context, index) {
                      return CustomNewsCard(
                        story: section.sideStories[index],
                        compact: true,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  BroadcastSectionSidebar(section: section),
                ],
              );
            },
          ),
          SizedBox(height: gap),
          const CustomSectionTitle(
            title: 'Key Indicators',
            subtitle: 'Reference points prepared for the on-air presenter.',
            eyebrow: 'Data Wall',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: _buildIndicators(section),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIndicators(BroadcastSection section) {
    if (section.key == SectionKeys.weather) {
      return section.highlights
          .map(
            (metric) => CustomWeatherCard(
              label: metric.label,
              value: metric.value,
              details: metric.caption,
              icon: _weatherIcon(metric),
            ),
          )
          .toList();
    }

    return section.highlights
        .map((metric) => CustomStatBox(metric: metric))
        .toList();
  }

  IconData _weatherIcon(ProgramMetric metric) {
    final label = metric.label.toLowerCase();

    if (label.contains('wind')) {
      return Icons.air_outlined;
    }
    if (label.contains('alert')) {
      return Icons.warning_amber_outlined;
    }
    if (label.contains('high') || label.contains('temp')) {
      return Icons.thermostat_outlined;
    }

    return Icons.wb_sunny_outlined;
  }
}
