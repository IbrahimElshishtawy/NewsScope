import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_media_frame.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';
import 'package:newscope/modules/weather/controllers/weather_controller.dart';
import 'package:newscope/modules/weather/widgets/city_temperature_card.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgramShell(
      title: controller.title,
      subtitle: 'شاشة طقس أوضح قراءة مع بطاقات أخف ومساحات أفضل للمحتوى',
      tickerItems: controller.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom3dReveal(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: App3dStyles.panelDecoration(
                    tone: App3dTone.accent,
                    radius: 24,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.paperWhite,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            controller.warningBanner,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.cardBody.copyWith(
                              color: AppColors.paperWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Custom3dReveal(
                delay: const Duration(milliseconds: 80),
                child: isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Custom3dMediaFrame(
                              title: 'خريطة الأحوال الجوية',
                              subtitle: controller.section.leadStory.summary,
                              icon: Icons.map_outlined,
                              badge: 'مركز الأرصاد',
                              footer: controller.section.leadStory.location,
                              tone: App3dTone.dark,
                            ),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            flex: 5,
                            child: Wrap(
                              spacing: 14,
                              runSpacing: 14,
                              children: [
                                for (
                                  var index = 0;
                                  index < controller.weatherStats.length;
                                  index++
                                )
                                  Custom3dStatBox(
                                    label: controller.weatherStats[index].label,
                                    value: controller.weatherStats[index].value,
                                    caption:
                                        controller.weatherStats[index].caption,
                                    tone: index == 1
                                        ? App3dTone.dark
                                        : App3dTone.surface,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Custom3dMediaFrame(
                        title: 'خريطة الأحوال الجوية',
                        subtitle: controller.section.leadStory.summary,
                        icon: Icons.map_outlined,
                        badge: 'مركز الأرصاد',
                        footer: controller.section.leadStory.location,
                        tone: App3dTone.dark,
                      ),
              ),
              const SizedBox(height: 22),
              const Custom3dSectionHeader(
                eyebrow: 'درجات الحرارة',
                title: 'المدن الرئيسية',
                subtitle:
                    'بطاقات عائمة مختصرة تمنح قراءات الطقس وضوحًا أفضل وتقلل المساحات المهدرة.',
              ),
              const SizedBox(height: 14),
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
              if (!isWide) ...[
                const SizedBox(height: 22),
                const Custom3dSectionHeader(
                  eyebrow: 'مؤشرات سريعة',
                  title: 'لوحة التوقعات',
                  subtitle:
                      'صناديق مرجعية مختصرة لعرض القراءات الحاسمة داخل مركز الأرصاد.',
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    for (
                      var index = 0;
                      index < controller.weatherStats.length;
                      index++
                    )
                      Custom3dStatBox(
                        label: controller.weatherStats[index].label,
                        value: controller.weatherStats[index].value,
                        caption: controller.weatherStats[index].caption,
                        tone: index == 1 ? App3dTone.dark : App3dTone.surface,
                      ),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
