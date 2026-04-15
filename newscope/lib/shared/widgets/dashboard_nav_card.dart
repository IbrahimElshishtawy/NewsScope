import 'package:flutter/material.dart';
import 'package:newscope/data/models/dashboard_destination.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class DashboardNavCard extends StatelessWidget {
  const DashboardNavCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  final DashboardDestination destination;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.paperWhite,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.softGray),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.studioBlue.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  destination.icon,
                  color: AppColors.studioBlue,
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                destination.scheduleLabel,
                style: AppTextStyles.meta.copyWith(
                  color: AppColors.broadcastRed,
                ),
              ),
              const SizedBox(height: 8),
              Text(destination.title, style: AppTextStyles.headline),
              const SizedBox(height: 10),
              Text(destination.summary, style: AppTextStyles.body),
              const Spacer(),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Open Page', style: AppTextStyles.bodyStrong),
                  const Icon(
                    Icons.arrow_forward_outlined,
                    color: AppColors.broadcastRed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
