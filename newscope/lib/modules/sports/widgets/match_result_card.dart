import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class MatchResultCard extends StatelessWidget {
  const MatchResultCard({
    super.key,
    required this.competition,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.status,
    required this.icon,
  });

  final String competition;
  final String homeTeam;
  final String awayTeam;
  final String score;
  final String status;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.midnightBlue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.paperWhite),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(competition, style: AppTextStyles.bodyStrong),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: AppColors.broadcastRed.withValues(alpha: 0.12),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.broadcastRed,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Text(
                  homeTeam,
                  style: AppTextStyles.headline.copyWith(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  score,
                  style: AppTextStyles.pageTitle.copyWith(
                    color: AppColors.broadcastRed,
                    fontSize: 28,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  awayTeam,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.headline.copyWith(fontSize: 22),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
