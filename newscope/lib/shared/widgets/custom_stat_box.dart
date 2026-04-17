import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';
import 'package:newscope/data/models/program_metric.dart';

class CustomStatBox extends StatelessWidget {
  const CustomStatBox({super.key, required this.metric});

  final ProgramMetric metric;

  @override
  Widget build(BuildContext context) {
    return Custom3dStatBox(
      label: metric.label,
      value: metric.value,
      caption: metric.caption,
    );
  }
}
