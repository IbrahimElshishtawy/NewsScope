import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_ticker.dart';

class CustomTicker extends StatelessWidget {
  const CustomTicker({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Custom3dTicker(items: items);
  }
}
