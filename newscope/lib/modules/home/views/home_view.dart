import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/home/controllers/home_controller.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF071628),
        body: Stack(
          children: [
            Positioned(
              top: -80,
              right: -80,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.broadcastRed.withValues(alpha: 0.12),
                ),
              ),
            ),
            Positioned(
              bottom: -120,
              left: -50,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.paperWhite.withValues(alpha: 0.04),
                ),
              ),
            ),
            SafeArea(
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
                            Color(0xFF0C2342),
                            AppColors.midnightBlue,
                            AppColors.studioBlue,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        border: Border.all(
                          color: AppColors.paperWhite.withValues(alpha: 0.08),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.broadcastRed,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  'LIVE CONTROL',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.paperWhite,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: AppColors.paperWhite.withValues(
                                    alpha: 0.08,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(
                                  Icons.settings_input_antenna_rounded,
                                  color: AppColors.paperWhite,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),
                          Text(
                            'لوحة تحكم نشرة الأخبار',
                            style: AppTextStyles.masthead.copyWith(
                              fontSize: 30,
                              color: AppColors.paperWhite,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'واجهة رئيسية بطابع غرفة تحكم تلفزيونية رسمية، تضع جميع فقرات البرنامج في مكان واحد مع انتقال مباشر عبر GetX.',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.softGray,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: controller.statusItems
                                .map(
                                  (item) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.paperWhite.withValues(
                                        alpha: 0.08,
                                      ),
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(
                                        color: AppColors.paperWhite.withValues(
                                          alpha: 0.10,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      item,
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.paperWhite,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            controller.editorialQuote.quote,
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.paperWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        final columns = width >= 1250
                            ? 4
                            : width >= 900
                            ? 3
                            : width >= 620
                            ? 2
                            : 1;
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
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(24),
                                    onTap: () =>
                                        controller.openRoute(destination.route),
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0B1E34),
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                          color: AppColors.paperWhite
                                              .withValues(alpha: 0.08),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.14,
                                            ),
                                            blurRadius: 18,
                                            offset: const Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: AppColors.broadcastRed
                                                      .withValues(alpha: 0.14),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Icon(
                                                  destination.icon,
                                                  color: AppColors.paperWhite,
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                destination.scheduleLabel,
                                                style: AppTextStyles.caption
                                                    .copyWith(
                                                      color: AppColors.softGray,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 18),
                                          Text(
                                            destination.title,
                                            style: AppTextStyles.headline
                                                .copyWith(
                                                  color: AppColors.paperWhite,
                                                ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            destination.summary,
                                            style: AppTextStyles.body.copyWith(
                                              color: AppColors.softGray,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 18),
                                          Row(
                                            children: [
                                              Text(
                                                'فتح الصفحة',
                                                style: AppTextStyles.caption
                                                    .copyWith(
                                                      color: AppColors
                                                          .broadcastRed,
                                                    ),
                                              ),
                                              const SizedBox(width: 8),
                                              const Icon(
                                                Icons.arrow_forward_rounded,
                                                color: AppColors.broadcastRed,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: controller.metrics
                          .map(
                            (metric) => Container(
                              width: 220,
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
                                    metric.label,
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.steelGray,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    metric.value,
                                    style: AppTextStyles.pageTitle.copyWith(
                                      color: AppColors.midnightBlue,
                                      fontSize: 28,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    metric.caption,
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.broadcastRed,
                        borderRadius: BorderRadius.circular(20),
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
          ],
        ),
      ),
    );
  }
}
