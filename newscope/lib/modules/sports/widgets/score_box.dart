import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';

class ScoreBox extends StatelessWidget {
  const ScoreBox({
    super.key,
    required this.label,
    required this.value,
    required this.caption,
  });

  final String label;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Custom3dStatBox(
      label: label,
      value: value,
      caption: caption,
      tone: App3dTone.dark,
    );
  }
}
