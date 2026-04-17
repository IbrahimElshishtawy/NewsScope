import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/theme/app_depth_tokens.dart';

class Custom3dReveal extends StatefulWidget {
  const Custom3dReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AppDepthTokens.mediumMotion,
    this.beginOffset = const Offset(0, 0.05),
    this.beginScale = 0.96,
    this.rotateY = 0.04,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset beginOffset;
  final double beginScale;
  final double rotateY;

  @override
  State<Custom3dReveal> createState() => _Custom3dRevealState();
}

class _Custom3dRevealState extends State<Custom3dReveal> {
  bool _visible = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.delay, () {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.duration,
      curve: Curves.easeOutCubic,
      opacity: _visible ? 1 : 0,
      child: TweenAnimationBuilder<double>(
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        tween: Tween<double>(begin: 0, end: _visible ? 1 : 0),
        builder: (context, value, child) {
          final scale = lerpDouble(widget.beginScale, 1, value)!;
          final offset = Offset.lerp(widget.beginOffset, Offset.zero, value)!;
          final rotateY = lerpDouble(widget.rotateY, 0, value)!;

          return Transform.translate(
            offset: Offset(0, offset.dy * 120),
            child: Transform(
              alignment: Alignment.center,
              transform: App3dStyles.tiltedMatrix(
                rotateY: rotateY,
                scale: scale,
              ),
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
