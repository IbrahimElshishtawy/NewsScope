import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_card.dart';
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
    return Custom3dCard(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 360;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: AppColors.midnightBlue,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            icon,
                            color: AppColors.paperWhite,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth - 120,
                          ),
                          child: Text(
                            competition,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.cardBodyStrong,
                          ),
                        ),
                      ],
                    ),
                    Custom3dBadge(
                      label: status,
                      backgroundColor: AppColors.broadcastRed.withValues(
                        alpha: 0.12,
                      ),
                      foregroundColor: AppColors.broadcastRed,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                isCompact
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTeamLine(homeTeam, TextAlign.start),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(
                                score,
                                style: AppTextStyles.cardValue.copyWith(
                                  color: AppColors.broadcastRed,
                                ),
                              ),
                            ),
                          ),
                          _buildTeamLine(awayTeam, TextAlign.start),
                          const SizedBox(height: 10),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Text(
                              homeTeam,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.cardTitleSecondary,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              score,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.cardValue.copyWith(
                                color: AppColors.broadcastRed,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              awayTeam,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                              style: AppTextStyles.cardTitleSecondary,
                            ),
                          ),
                        ],
                      ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTeamLine(String team, TextAlign textAlign) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.ivory,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Text(
        team,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: AppTextStyles.cardTitleSecondary,
      ),
    );
  }
}
