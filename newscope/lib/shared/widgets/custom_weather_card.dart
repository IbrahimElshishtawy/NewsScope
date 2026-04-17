import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_weather_card.dart';

class CustomWeatherCard extends StatelessWidget {
  const CustomWeatherCard({
    super.key,
    required this.label,
    required this.value,
    required this.details,
    required this.icon,
  });

  final String label;
  final String value;
  final String details;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Custom3dWeatherCard(
      city: label,
      temperature: value,
      details: details,
      icon: icon,
    );
  }
}
