import 'package:flutter/material.dart';

class DashboardDestination {
  const DashboardDestination({
    required this.title,
    required this.route,
    required this.summary,
    required this.scheduleLabel,
    required this.icon,
  });

  final String title;
  final String route;
  final String summary;
  final String scheduleLabel;
  final IconData icon;
}
