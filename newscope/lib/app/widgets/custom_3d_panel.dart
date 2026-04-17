import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/theme/app_depth_tokens.dart';

class Custom3dPanel extends StatelessWidget {
  const Custom3dPanel({
    super.key,
    required this.child,
    this.tone = App3dTone.surface,
    this.padding = AppDepthTokens.panelPadding,
    this.radius = AppDepthTokens.radiusMd,
    this.accentColor,
    this.alignment,
  });

  final Widget child;
  final App3dTone tone;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color? accentColor;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius);
    final panel = Container(
      width: double.infinity,
      alignment: alignment,
      padding: padding,
      decoration: App3dStyles.panelDecoration(
        tone: tone,
        radius: radius,
        accentColor: accentColor,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  gradient: App3dStyles.panelHighlight,
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );

    if (tone != App3dTone.glass) {
      return panel;
    }

    return App3dStyles.glassBlur(borderRadius: borderRadius, child: panel);
  }
}
