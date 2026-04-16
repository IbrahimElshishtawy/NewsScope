import 'package:flutter/material.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/models/program_metric.dart';

class WeatherController extends BroadcastSectionController {
  WeatherController({required super.repository})
    : super(sectionKey: SectionKeys.weather);

  String get title => 'الطقس';

  String get warningBanner =>
      'تنبيه: رياح نشطة وانخفاض متوقع في الرؤية على بعض الطرق المفتوحة خلال ساعات المساء.';

  List<ProgramMetric> get weatherStats => section.highlights;

  List<
    ({
      String city,
      String temperature,
      String range,
      String condition,
      IconData icon,
    })
  >
  get cityForecasts => const [
    (
      city: 'القاهرة',
      temperature: '29°',
      range: '24° / 29°',
      condition: 'مشمس جزئياً',
      icon: Icons.wb_sunny_outlined,
    ),
    (
      city: 'الإسكندرية',
      temperature: '25°',
      range: '21° / 25°',
      condition: 'رياح معتدلة',
      icon: Icons.air_rounded,
    ),
    (
      city: 'أسوان',
      temperature: '34°',
      range: '27° / 34°',
      condition: 'أجواء حارة',
      icon: Icons.thermostat_rounded,
    ),
    (
      city: 'مطروح',
      temperature: '23°',
      range: '19° / 23°',
      condition: 'سحب خفيفة',
      icon: Icons.cloud_outlined,
    ),
  ];
}
