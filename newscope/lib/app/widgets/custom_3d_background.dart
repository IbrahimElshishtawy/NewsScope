import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/themes/app_colors.dart';

class Custom3dBackground extends StatelessWidget {
  const Custom3dBackground({
    super.key,
    required this.child,
    this.showGrid = true,
    this.showSignalRings = true,
    this.showCenterBeam = true,
  });

  final Widget child;
  final bool showGrid;
  final bool showSignalRings;
  final bool showCenterBeam;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: App3dStyles.backgroundGradient),
      child: Stack(
        children: [
          Positioned(
            top: -120,
            right: -70,
            child: _GlowOrb(
              size: 260,
              color: AppColors.broadcastRed.withValues(alpha: 0.20),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -80,
            child: _GlowOrb(
              size: 320,
              color: AppColors.paperWhite.withValues(alpha: 0.06),
            ),
          ),
          if (showSignalRings) ...[
            const Positioned(top: 80, left: -40, child: _SignalRing(size: 240)),
            const Positioned(
              top: 110,
              right: 30,
              child: _SignalRing(size: 180),
            ),
          ],
          if (showCenterBeam)
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.paperWhite.withValues(alpha: 0.03),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          if (showGrid) const Positioned.fill(child: _GridOverlay()),
          child,
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
      ),
    );
  }
}

class _SignalRing extends StatelessWidget {
  const _SignalRing({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
    );
  }
}

class _GridOverlay extends StatelessWidget {
  const _GridOverlay();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _GridPainter());
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.paperWhite.withValues(alpha: 0.05)
      ..strokeWidth = 1;

    for (double y = 48; y < size.height; y += 48) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (double x = 54; x < size.width; x += 54) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
