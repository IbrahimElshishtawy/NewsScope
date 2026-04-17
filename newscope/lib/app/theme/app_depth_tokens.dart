import 'package:flutter/material.dart';

class AppDepthTokens {
  const AppDepthTokens._();

  static const double radiusXs = 14;
  static const double radiusSm = 18;
  static const double radiusMd = 24;
  static const double radiusLg = 30;
  static const double radiusXl = 38;

  static const EdgeInsets panelPadding = EdgeInsets.all(22);
  static const EdgeInsets cardPadding = EdgeInsets.all(20);
  static const EdgeInsets compactPadding = EdgeInsets.all(16);

  static const Duration shortMotion = Duration(milliseconds: 220);
  static const Duration mediumMotion = Duration(milliseconds: 420);
  static const Duration longMotion = Duration(milliseconds: 650);

  static const double perspective = 0.0018;
  static const double hoverLift = 8;
  static const double pressedDepth = 4;

  static List<BoxShadow> surfaceShadow(Color color) {
    return [
      BoxShadow(
        color: color.withValues(alpha: 0.24),
        blurRadius: 26,
        offset: const Offset(0, 16),
      ),
      BoxShadow(
        color: Colors.white.withValues(alpha: 0.05),
        blurRadius: 1,
        offset: const Offset(0, -1),
      ),
    ];
  }

  static List<BoxShadow> darkShadow(Color color) {
    return [
      BoxShadow(
        color: color.withValues(alpha: 0.42),
        blurRadius: 38,
        offset: const Offset(0, 22),
      ),
      BoxShadow(
        color: Colors.white.withValues(alpha: 0.04),
        blurRadius: 1,
        offset: const Offset(0, -1),
      ),
    ];
  }
}
