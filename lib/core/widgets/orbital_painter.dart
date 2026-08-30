import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OrbitalPainter extends CustomPainter {
  final double animationValue;
  final Color primaryColor;
  final Color secondaryColor;
  final double opacity;

  OrbitalPainter({
    required this.animationValue,
    this.primaryColor = AppTheme.green,
    this.secondaryColor = AppTheme.orange,
    this.opacity = 1.0,
  }) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) * 0.45;

    // Draw outer orbit ring (faint)
    _drawOrbitRing(canvas, center, maxRadius, primaryColor, opacity * 0.15);
    _drawOrbitRing(canvas, center, maxRadius * 0.72, secondaryColor, opacity * 0.12);
    _drawOrbitRing(canvas, center, maxRadius * 0.45, primaryColor, opacity * 0.18);

    // Draw rotating dots on orbits
    _drawOrbitDot(
      canvas, center, maxRadius,
      animationValue * 2 * math.pi,
      primaryColor, opacity * 0.9, 6,
    );
    _drawOrbitDot(
      canvas, center, maxRadius,
      animationValue * 2 * math.pi + math.pi,
      secondaryColor.withOpacity(0.0), opacity * 0.0, 0,
    );

    _drawOrbitDot(
      canvas, center, maxRadius * 0.72,
      -animationValue * 2 * math.pi * 1.3,
      secondaryColor, opacity * 0.8, 8,
    );

    _drawOrbitDot(
      canvas, center, maxRadius * 0.45,
      animationValue * 2 * math.pi * 1.8,
      primaryColor, opacity * 0.7, 5,
    );

    // Draw glow at center
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          primaryColor.withOpacity(opacity * 0.15),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: maxRadius * 0.3));
    canvas.drawCircle(center, maxRadius * 0.3, glowPaint);
  }

  void _drawOrbitRing(
    Canvas canvas, Offset center, double radius, Color color, double opacity) {
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, radius, paint);
  }

  void _drawOrbitDot(
    Canvas canvas, Offset center, double radius,
    double angle, Color color, double opacity, double dotSize) {
    if (dotSize == 0) return;
    final x = center.dx + radius * math.cos(angle);
    final y = center.dy + radius * math.sin(angle);
    final dotOffset = Offset(x, y);

    // Glow
    final glowPaint = Paint()
      ..color = color.withOpacity(opacity * 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(dotOffset, dotSize * 1.8, glowPaint);

    // Core dot
    final dotPaint = Paint()
      ..color = color.withOpacity(opacity);
    canvas.drawCircle(dotOffset, dotSize, dotPaint);
  }

  @override
  bool shouldRepaint(OrbitalPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue ||
      oldDelegate.opacity != opacity;
}

class OrbitalAnimation extends StatefulWidget {
  final double size;
  final Color primaryColor;
  final Color secondaryColor;
  final Widget? child;
  final double opacity;

  const OrbitalAnimation({
    super.key,
    this.size = 400,
    this.primaryColor = AppTheme.green,
    this.secondaryColor = AppTheme.orange,
    this.child,
    this.opacity = 1.0,
  });

  @override
  State<OrbitalAnimation> createState() => _OrbitalAnimationState();
}

class _OrbitalAnimationState extends State<OrbitalAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: OrbitalPainter(
                  animationValue: _controller.value,
                  primaryColor: widget.primaryColor,
                  secondaryColor: widget.secondaryColor,
                  opacity: widget.opacity,
                ),
              ),
              if (widget.child != null) widget.child!,
            ],
          ),
        );
      },
    );
  }
}
