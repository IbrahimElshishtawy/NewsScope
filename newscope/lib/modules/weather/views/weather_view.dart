import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/weather/controllers/weather_controller.dart';
import 'package:newscope/modules/weather/widgets/city_temperature_card.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF081A2E),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
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
                const SizedBox(height: 8),
                Text(
                  'عرض واضح ومباشر لفقرة الأحوال الجوية، مناسب لاستخدامه داخل نشرة أخبار رسمية.',
                  style: AppTextStyles.body.copyWith(color: AppColors.softGray),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.broadcastRed.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.broadcastRed.withValues(alpha: 0.24),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: AppColors.paperWhite,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          controller.warningBanner,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.paperWhite,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF13375E),
                        AppColors.midnightBlue,
                        Color(0xFF0A2543),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 22,
                        right: 22,
                        child: Text(
                          'خريطة الطقس',
                          style: AppTextStyles.headline.copyWith(
                            color: AppColors.paperWhite,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.paperWhite.withValues(
                                alpha: 0.10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.map_outlined,
                              size: 64,
                              color: AppColors.paperWhite,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'مساحة مخصصة لخريطة الأحوال الجوية',
                              style: AppTextStyles.bodyStrong.copyWith(
                                color: AppColors.paperWhite,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              controller.section.leadStory.summary,
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
                const SizedBox(height: 20),
                Text(
                  'درجات الحرارة حسب المدن',
                  style: AppTextStyles.pageTitle.copyWith(
                    color: AppColors.paperWhite,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: controller.cityForecasts
                      .map(
                        (forecast) => CityTemperatureCard(
                          city: forecast.city,
                          temperature: forecast.temperature,
                          range: forecast.range,
                          condition: forecast.condition,
                          icon: forecast.icon,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),
                Text(
                  'مؤشرات سريعة',
                  style: AppTextStyles.pageTitle.copyWith(
                    color: AppColors.paperWhite,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: controller.weatherStats
                      .map(
                        (metric) => Container(
                          width: 220,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: AppColors.paperWhite,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(metric.label, style: AppTextStyles.caption),
                              const SizedBox(height: 12),
                              Text(
                                metric.value.replaceAll('Â', ''),
                                style: AppTextStyles.pageTitle.copyWith(
                                  fontSize: 28,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(metric.caption, style: AppTextStyles.body),
                            ],
                          ),
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
