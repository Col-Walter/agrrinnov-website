import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedCounter extends StatefulWidget {
  final double endValue;
  final String suffix;
  final String label;
  final Color color;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.endValue,
    this.suffix = '',
    required this.label,
    this.color = AppTheme.green,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: widget.endValue).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    // Start animation on mount with a microtask delay for smooth rendering
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  void _startAnimation() {
    if (!_hasAnimated) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            final value = _animation.value;
            final display = value >= 10
                ? value.toInt().toString()
                : value.toStringAsFixed(1);
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: display,
                    style: AppTheme.displaySmall.copyWith(
                      color: widget.color,
                      fontSize: 52,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: widget.suffix,
                    style: AppTheme.headlineMedium.copyWith(
                      color: widget.color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Text(
          widget.label,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// Scroll reveal widget (bypasses VisibilityDetector for robust Web loading)
class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset beginOffset;

  const ScrollReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.beginOffset = const Offset(0, 40),
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slide = Tween<Offset>(
      begin: widget.beginOffset / 100,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Trigger reveal immediately after delay
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}
