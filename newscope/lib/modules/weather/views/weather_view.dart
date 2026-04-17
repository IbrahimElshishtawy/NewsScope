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

class WeatherView extends GetView<WeatherController> {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgramShell(
      title: controller.title,
      subtitle: 'شاشة طقس ثلاثية الأبعاد ببطاقات عائمة ولوحة خريطة',
      tickerItems: controller.tickerItems,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom3dReveal(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: App3dStyles.panelDecoration(
                tone: App3dTone.accent,
                radius: 24,
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
                      style: const TextStyle(
                        color: AppColors.paperWhite,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Custom3dReveal(
            delay: const Duration(milliseconds: 80),
            child: Custom3dMediaFrame(
              title: 'خريطة الأحوال الجوية',
              subtitle: controller.section.leadStory.summary,
              icon: Icons.map_outlined,
              badge: 'مركز الأرصاد',
              footer: controller.section.leadStory.location,
              tone: App3dTone.dark,
            ),
          ),
          const SizedBox(height: 24),
          const Custom3dSectionHeader(
            eyebrow: 'درجات الحرارة',
            title: 'المدن الرئيسية',
            subtitle:
                'بطاقات عائمة بتدرج ضوئي خفيف تمنح قراءات الطقس ثراء بصرياً مع الحفاظ على الوضوح.',
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 24),
          const Custom3dSectionHeader(
            eyebrow: 'مؤشرات سريعة',
            title: 'لوحة التوقعات',
            subtitle:
                'صناديق مرجعية مرتفعة لعرض القراءات الجوية الحاسمة داخل مركز الأرصاد.',
          ),
          const SizedBox(height: 16),
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
      ),
    );
  }
}
