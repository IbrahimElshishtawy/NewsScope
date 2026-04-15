import 'package:flutter/material.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/shared/widgets/custom_section_title.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class BroadcastSectionSidebar extends StatelessWidget {
  const BroadcastSectionSidebar({super.key, required this.section});

  final BroadcastSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSectionTitle(
          title: 'Editorial Line',
          subtitle: 'Quote, notes, and rundown prepared for the anchor desk.',
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.paperWhite,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.softGray),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Anchor Quote', style: AppTextStyles.meta),
              const SizedBox(height: 12),
              Text(
                '"${section.quote.quote}"',
                style: AppTextStyles.bodyStrong.copyWith(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                '${section.quote.speaker} • ${section.quote.role}',
                style: AppTextStyles.meta.copyWith(
                  color: AppColors.broadcastRed,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.paperWhite,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.softGray),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rundown Notes', style: AppTextStyles.meta),
              const SizedBox(height: 12),
              for (final item in section.agenda) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.square,
                        size: 10,
                        color: AppColors.broadcastRed,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(item, style: AppTextStyles.body)),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
