import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_depth_tokens.dart';
import 'package:newscope/themes/app_colors.dart';

enum App3dTone { surface, dark, accent, glass }

class App3dStyles {
  const App3dStyles._();

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF020812),
      Color(0xFF08192F),
      Color(0xFF102844),
      Color(0xFF081A2F),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const LinearGradient panelHighlight = LinearGradient(
    colors: [Color(0x22FFFFFF), Colors.transparent, Color(0x10C62828)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static BoxDecoration panelDecoration({
    App3dTone tone = App3dTone.surface,
    double radius = AppDepthTokens.radiusMd,
    Color? accentColor,
  }) {
    final accent = accentColor ?? AppColors.broadcastRed;

    switch (tone) {
      case App3dTone.dark:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: const LinearGradient(
            colors: [Color(0xFF0E223B), Color(0xFF08172C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          boxShadow: AppDepthTokens.darkShadow(Colors.black),
        );
      case App3dTone.accent:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            colors: [accent.withValues(alpha: 0.90), const Color(0xFF5F101E)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
          boxShadow: AppDepthTokens.darkShadow(accent),
        );
      case App3dTone.glass:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: 0.11),
              Colors.white.withValues(alpha: 0.04),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          boxShadow: AppDepthTokens.darkShadow(Colors.black),
        );
      case App3dTone.surface:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: const LinearGradient(
            colors: [Color(0xFFFDFEFF), Color(0xFFF0F3F8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: AppColors.borderGray.withValues(alpha: 0.9),
          ),
          boxShadow: AppDepthTokens.surfaceShadow(AppColors.midnightBlue),
        );
    }
  }

  static BoxDecoration insetDecoration({
    bool dark = false,
    double radius = AppDepthTokens.radiusSm,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: LinearGradient(
        colors: dark
            ? [
                Colors.white.withValues(alpha: 0.08),
                Colors.white.withValues(alpha: 0.03),
              ]
            : [Colors.white, const Color(0xFFE8EEF6)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      border: Border.all(
        color: dark
            ? Colors.white.withValues(alpha: 0.08)
            : AppColors.borderGray.withValues(alpha: 0.8),
      ),
    );
  }

  static Widget glassBlur({
    required BorderRadius borderRadius,
    required Widget child,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: child,
      ),
    );
  }

  static Matrix4 tiltedMatrix({
    double rotateX = 0,
    double rotateY = 0,
    double rotateZ = 0,
    double scale = 1,
  }) {
    return Matrix4.identity()
      ..setEntry(3, 2, AppDepthTokens.perspective)
      ..rotateX(rotateX)
      ..rotateY(rotateY)
      ..rotateZ(rotateZ)
      ..scaleByDouble(scale, scale, scale, 1);
  }
}
