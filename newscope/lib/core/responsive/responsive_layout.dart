import 'package:flutter/material.dart';

class ResponsiveLayout {
  static bool isMobile(BuildContext context) => _width(context) < 720;

  static bool isTablet(BuildContext context) =>
      _width(context) >= 720 && _width(context) < 1100;

  static bool isDesktop(BuildContext context) => _width(context) >= 1100;

  static EdgeInsets pagePadding(BuildContext context) {
    final width = _width(context);

    if (width >= 1200) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 28);
    }

    if (width >= 720) {
      return const EdgeInsets.symmetric(horizontal: 28, vertical: 24);
    }

    return const EdgeInsets.symmetric(horizontal: 18, vertical: 20);
  }

  static double maxContentWidth(BuildContext context) {
    final width = _width(context);
    return width >= 1400 ? 1320 : width;
  }

  static double sectionGap(BuildContext context) {
    if (isDesktop(context)) {
      return 24;
    }

    if (isTablet(context)) {
      return 20;
    }

    return 16;
  }

  static int navigationColumns(BuildContext context) {
    if (isDesktop(context)) {
      return 3;
    }

    if (isTablet(context)) {
      return 2;
    }

    return 1;
  }

  static double _width(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
