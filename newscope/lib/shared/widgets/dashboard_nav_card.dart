import 'package:flutter/material.dart';
import 'package:newscope/data/models/dashboard_destination.dart';
import 'package:newscope/shared/widgets/custom_nav_card.dart';

@Deprecated('Use CustomNavCard instead.')
class DashboardNavCard extends StatelessWidget {
  const DashboardNavCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  final DashboardDestination destination;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomNavCard(destination: destination, onTap: onTap);
  }
}
