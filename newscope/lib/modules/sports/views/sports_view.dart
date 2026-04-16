import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/sports/controllers/sports_controller.dart';
import 'package:newscope/modules/sports/widgets/match_result_card.dart';
import 'package:newscope/modules/sports/widgets/score_box.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class SportsView extends GetView<SportsController> {
  const SportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF091628),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.midnightBlue,
                        Color(0xFF143861),
                        AppColors.broadcastRed,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.title,
                        style: AppTextStyles.masthead.copyWith(
                          color: AppColors.paperWhite,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'تصميم رياضي متسق مع هوية النشرة الرئيسية، مع إيقاع بصري أكثر نشاطًا ووضوحًا في النتائج والمؤشرات.',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.softGray,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColors.paperWhite.withValues(alpha: 0.08),
                          border: Border.all(
                            color: AppColors.paperWhite.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: -20,
                              left: -10,
                              child: Icon(
                                Icons.sports_soccer_rounded,
                                size: 160,
                                color: AppColors.paperWhite.withValues(
                                  alpha: 0.08,
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.emoji_events_rounded,
                                    size: 50,
                                    color: AppColors.paperWhite,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'مساحة صورة رياضية رئيسية',
                                    style: AppTextStyles.headline.copyWith(
                                      color: AppColors.paperWhite,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    controller.section.leadStory.title,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.body.copyWith(
                                      color: AppColors.softGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'نتائج المباريات',
                  style: AppTextStyles.pageTitle.copyWith(
                    color: AppColors.paperWhite,
                  ),
                ),
                const SizedBox(height: 12),
                ...controller.matches.map(
                  (match) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: MatchResultCard(
                      competition: match.competition,
                      homeTeam: match.homeTeam,
                      awayTeam: match.awayTeam,
                      score: match.score,
                      status: match.status,
                      icon: match.icon,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'مؤشرات وترتيبات',
                  style: AppTextStyles.pageTitle.copyWith(
                    color: AppColors.paperWhite,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: controller.scoreBoxes
                      .map(
                        (metric) => ScoreBox(
                          label: metric.label,
                          value: metric.value,
                          caption: metric.caption,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.broadcastRed,
                  ),
                  child: Text(
                    controller.tickerItems.join('  •  '),
                    style: AppTextStyles.ticker,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
