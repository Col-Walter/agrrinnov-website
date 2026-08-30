import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/orbital_painter.dart';
import '../../../../core/widgets/particle_system.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onDiscoverServices;
  final VoidCallback onVision;

  const HeroSection({
    super.key,
    required this.onDiscoverServices,
    required this.onVision,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _bounceController;
  late Animation<double> _fadeIn;
  late Animation<double> _bounce;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _fadeIn = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _bounce = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    final isTablet = AppTheme.isTablet(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: math.max(screenHeight, 700),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A0A0A), Color(0xFF111111), Color(0xFF0D1A10)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Particles background
          const Positioned.fill(child: ParticleBackground(particleCount: 40)),

          // Large orbital in background (decorative)
          Positioned(
            right: isMobile ? -100 : -50,
            top: isMobile ? -100 : 0,
            child: OrbitalAnimation(
              size: isMobile ? 400 : 700,
              primaryColor: AppTheme.green.withOpacity(0.4),
              secondaryColor: AppTheme.orange.withOpacity(0.4),
              opacity: 0.5,
            ),
          ),

          // Bottom gradient fade
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Color(0xFF111111)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Content
          Positioned.fill(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppTheme.sectionPadding(context),
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: isMobile
                      ? _buildMobileLayout(screenWidth)
                      : _buildDesktopLayout(screenWidth, isTablet),
                ),
              ),
            ),
          ),

          // Scroll indicator
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _bounce,
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0, _bounce.value),
                  child: const Column(
                    children: [
                      Icon(Icons.keyboard_arrow_down,
                          color: AppTheme.green, size: 28),
                      SizedBox(height: 4),
                      Icon(Icons.keyboard_arrow_down,
                          color: AppTheme.green, size: 20),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(double screenWidth, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text content
        Expanded(
          flex: 5,
          child: FadeTransition(
            opacity: _fadeIn,
            child: _buildTextContent(false),
          ),
        ),
        const SizedBox(width: 40),
        // Visual
        Expanded(
          flex: 4,
          child: FadeTransition(
            opacity: _fadeIn,
            child: _buildOrbitalVisual(isTablet ? 320 : 420),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(double screenWidth) {
    return FadeTransition(
      opacity: _fadeIn,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildOrbitalVisual(260),
          const SizedBox(height: 32),
          _buildTextContent(true),
        ],
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.green.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(30),
            color: AppTheme.green.withOpacity(0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                      color: AppTheme.green, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text(
                'Innovation Agritech',
                style: AppTheme.labelMedium.copyWith(
                  color: AppTheme.green,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Headline
        Text(
          "L'innovation\nau cœur de\nl'agriculture",
          style: AppTheme.displayLarge.copyWith(
            fontSize: isMobile ? 42 : 64,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 8),
        Text(
          "de demain.",
          style: AppTheme.displayLarge.copyWith(
            fontSize: isMobile ? 42 : 64,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [AppTheme.green, AppTheme.yellow],
              ).createShader(const Rect.fromLTWH(0, 0, 400, 70)),
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        const SizedBox(height: 24),
        Text(
          'Agrinnov connecte la tradition agricole à la\ntechnologie de pointe pour une agriculture\ndurable, rentable et innovante.',
          style: AppTheme.bodyLarge.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        const SizedBox(height: 40),

        // Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _HeroButton(
              label: 'Découvrir nos services',
              onTap: widget.onDiscoverServices,
              isPrimary: true,
            ),
            _HeroButton(
              label: 'Notre vision',
              onTap: widget.onVision,
              isPrimary: false,
            ),
          ],
        ),

        const SizedBox(height: 48),

        // Trust bar
        Wrap(
          spacing: 24,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _TrustItem(Icons.verified_outlined, '3 Services clés'),
            _TrustItem(Icons.eco_outlined, 'Agriculture durable'),
            _TrustItem(Icons.insights_outlined, 'Tech de pointe'),
          ],
        ),
      ],
    );
  }

  Widget _buildOrbitalVisual(double size) {
    return OrbitalAnimation(
      size: size,
      primaryColor: AppTheme.green,
      secondaryColor: AppTheme.orange,
      child: Container(
        width: size * 0.38,
        height: size * 0.38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const RadialGradient(
            colors: [Color(0xFF1F1F1F), Color(0xFF111111)],
          ),
          border: Border.all(
            color: AppTheme.green.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.green.withOpacity(0.2),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/logo_icone.png',
              width: size * 0.28,
              height: size * 0.28,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  const _HeroButton({
    required this.label,
    required this.onTap,
    required this.isPrimary,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            gradient: widget.isPrimary
                ? (_hovered ? AppTheme.greenGradient : AppTheme.greenGradient)
                : null,
            color: widget.isPrimary ? null : Colors.transparent,
            border: widget.isPrimary
                ? null
                : Border.all(
                    color: _hovered ? AppTheme.orange : AppTheme.greyBorder,
                    width: 1.5,
                  ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: _hovered && widget.isPrimary
                ? [
                    BoxShadow(
                      color: AppTheme.green.withOpacity(0.4),
                      blurRadius: 24,
                      offset: const Offset(0, 6),
                    )
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: AppTheme.labelLarge.copyWith(
              color: widget.isPrimary
                  ? AppTheme.white
                  : (_hovered ? AppTheme.orange : AppTheme.white),
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TrustItem(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppTheme.green, size: 16),
        const SizedBox(width: 6),
        Text(label,
            style: AppTheme.bodySmall.copyWith(color: AppTheme.grey)),
      ],
    );
  }
}
