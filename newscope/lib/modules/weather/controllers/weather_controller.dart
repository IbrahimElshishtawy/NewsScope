import 'package:flutter/material.dart';
import 'package:newscope/app/data/models/weather_model.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class WeatherController extends BroadcastSectionController {
  WeatherController({required NewsContentRepository repository})
    : _repository = repository,
      super(repository: repository, sectionKey: SectionKeys.weather);

  final NewsContentRepository _repository;

  String get title => 'الطقس';

  String get warningBanner => weatherItems
      .firstWhere((item) => item.warning != null, orElse: () => weatherItems[0])
      .warning ??
      'لا توجد تحذيرات جوية خاصة في التحديث الحالي.';

  List<ProgramMetric> get weatherStats => section.highlights;

  List<WeatherModel> get weatherItems => _repository.getWeatherItems();

  List<
    ({
      String city,
      String temperature,
      String range,
      String condition,
      IconData icon,
    })
  >
  get cityForecasts => weatherItems
      .map(
        (forecast) => (
          city: forecast.city,
          temperature: '${forecast.temperature}°',
          range: '${forecast.low}° / ${forecast.high}°',
          condition: forecast.condition,
          icon: _iconForCode(forecast.iconCode),
        ),
      )
      .toList(growable: false);

  IconData _iconForCode(String iconCode) {
    switch (iconCode) {
      case 'windy':
        return Icons.air_rounded;
      case 'dust':
        return Icons.warning_amber_rounded;
      case 'hot':
        return Icons.thermostat_rounded;
      case 'cloudy':
        return Icons.cloud_outlined;
      case 'clear':
        return Icons.nights_stay_outlined;
      case 'sunny':
      default:
        return Icons.wb_sunny_outlined;
    }
  }
}
