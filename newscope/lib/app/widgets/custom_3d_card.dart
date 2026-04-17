import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/theme/app_depth_tokens.dart';
import 'package:newscope/app/widgets/custom_3d_panel.dart';

class Custom3dCard extends StatefulWidget {
  const Custom3dCard({
    super.key,
    required this.child,
    this.onTap,
    this.tone = App3dTone.surface,
    this.padding = AppDepthTokens.cardPadding,
    this.radius = AppDepthTokens.radiusMd,
    this.accentColor,
  });

  final Widget child;
  final VoidCallback? onTap;
  final App3dTone tone;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color? accentColor;

  @override
  State<Custom3dCard> createState() => _Custom3dCardState();
}

class _Custom3dCardState extends State<Custom3dCard> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value) {
      setState(() {
        _pressed = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final child = Custom3dPanel(
      tone: widget.tone,
      padding: widget.padding,
      radius: widget.radius,
      accentColor: widget.accentColor,
      child: widget.child,
    );

    return AnimatedContainer(
      duration: AppDepthTokens.shortMotion,
      curve: Curves.easeOutCubic,
      transform:
          App3dStyles.tiltedMatrix(
            rotateX: _pressed ? 0.01 : 0,
            rotateY: _pressed ? -0.02 : 0,
            scale: _pressed ? 0.988 : 1,
          )..translateByDouble(
            0.0,
            _pressed ? AppDepthTokens.pressedDepth : 0.0,
            0.0,
            1.0,
          ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          onHighlightChanged: _setPressed,
          borderRadius: BorderRadius.circular(widget.radius),
          child: child,
        ),
      ),
    );
  }
}
