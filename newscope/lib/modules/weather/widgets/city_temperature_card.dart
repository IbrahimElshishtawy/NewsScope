import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_weather_card.dart';

class CityTemperatureCard extends StatelessWidget {
  const CityTemperatureCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.range,
    required this.condition,
    required this.icon,
  });

  final String city;
  final String temperature;
  final String range;
  final String condition;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Custom3dWeatherCard(
      city: city,
      temperature: temperature,
      details: condition,
      range: range,
      icon: icon,
    );
  }
}
