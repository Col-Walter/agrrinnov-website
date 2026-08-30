import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Particle {
  double x, y, size, speed, angle, opacity;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.angle,
    required this.opacity,
    required this.color,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final paint = Paint()
        ..color = p.color.withOpacity(p.opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      canvas.drawCircle(Offset(p.x * size.width, p.y * size.height), p.size, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}

class ParticleBackground extends StatefulWidget {
  final int particleCount;
  final List<Color> colors;

  const ParticleBackground({
    super.key,
    this.particleCount = 30,
    this.colors = const [AppTheme.green, AppTheme.orange, AppTheme.yellow],
  });

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles;
  final _random = math.Random();

  @override
  void initState() {
    super.initState();
    _initParticles();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(_updateParticles)..repeat();
  }

  void _initParticles() {
    _particles = List.generate(widget.particleCount, (i) => _createParticle());
  }

  Particle _createParticle() {
    return Particle(
      x: _random.nextDouble(),
      y: _random.nextDouble(),
      size: _random.nextDouble() * 2 + 0.5,
      speed: _random.nextDouble() * 0.0003 + 0.0001,
      angle: _random.nextDouble() * 2 * math.pi,
      opacity: _random.nextDouble() * 0.3 + 0.05,
      color: widget.colors[_random.nextInt(widget.colors.length)],
    );
  }

  void _updateParticles() {
    for (final p in _particles) {
      p.x += math.cos(p.angle) * p.speed;
      p.y += math.sin(p.angle) * p.speed;
      if (p.x < 0 || p.x > 1 || p.y < 0 || p.y > 1) {
        p.x = _random.nextDouble();
        p.y = _random.nextDouble();
        p.angle = _random.nextDouble() * 2 * math.pi;
      }
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ParticlePainter(_particles),
      size: Size.infinite,
    );
  }
}
