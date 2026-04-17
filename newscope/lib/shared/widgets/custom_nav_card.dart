import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_nav_tile.dart';
import 'package:newscope/data/models/dashboard_destination.dart';

class CustomNavCard extends StatelessWidget {
  const CustomNavCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  final DashboardDestination destination;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Custom3dNavTile(
      title: destination.title,
      subtitle: destination.summary,
      schedule: destination.scheduleLabel,
      icon: destination.icon,
      onTap: onTap,
    );
  }
}
