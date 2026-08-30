import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/orbital_painter.dart';
import '../../../../core/widgets/particle_system.dart';
import '../../../../core/widgets/animated_counter.dart';

class VisionSection extends StatelessWidget {
  const VisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF111111), Color(0xFF0A1A0D), Color(0xFF111111)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Particles
          const Positioned.fill(
            child: ParticleBackground(
              particleCount: 50,
              colors: [AppTheme.green, AppTheme.orange, AppTheme.yellow],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppTheme.sectionPadding(context),
              vertical: AppTheme.spacingXXL,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    // Title
                    ScrollReveal(
                      child: Column(
                        children: [
                          Text(
                            'NOTRE VISION',
                            style: AppTheme.labelLarge.copyWith(
                              color: AppTheme.orange,
                              letterSpacing: 4,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Le Noyau\nAgrinnov',
                            style: AppTheme.displayMedium.copyWith(
                              fontSize: isMobile ? 36 : 56,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 64),

                    // Main layout
                    isMobile
                        ? Column(
                            children: [
                              _buildOrbital(300),
                              const SizedBox(height: 48),
                              _buildVisionText(context),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: _buildVisionText(context)),
                              const SizedBox(width: 64),
                              _buildOrbital(440),
                            ],
                          ),

                    const SizedBox(height: 80),

                    // 3 Pillars
                    _buildPillars(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrbital(double size) {
    return OrbitalAnimation(
      size: size,
      primaryColor: AppTheme.green,
      secondaryColor: AppTheme.orange,
      child: Container(
        width: size * 0.36,
        height: size * 0.36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const RadialGradient(
            colors: [Color(0xFF1F2F22), Color(0xFF111111)],
          ),
          border: Border.all(
            color: AppTheme.green.withOpacity(0.4),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.green.withOpacity(0.3),
              blurRadius: 40,
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

  Widget _buildVisionText(BuildContext context) {
    return ScrollReveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"Agrinnov est le centre vers lequel tout converge et duquel tout rayonne."',
            style: AppTheme.headlineLarge.copyWith(
              color: AppTheme.orange,
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Solide, indéfectible, Agrinnov constitue le socle sur lequel repose l\'agriculture de demain — non pas une contrainte, mais un point d\'ancrage qui libère.',
            style: AppTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'De ce noyau partent des prolongements infinis : des explorations, des découvertes, des innovations sans limites. Agrinnov ne freine jamais le mouvement ; il l\'initie, le guide et l\'amplifie.',
            style: AppTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'Parce que l\'innovation véritable ne naît pas du vide — elle émerge de racines profondes, de savoirs accumulés, de pratiques éprouvées. Agrinnov honore ces acquis tout en ouvrant les portes de l\'avenir.',
            style: AppTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: AppTheme.green, width: 3),
              ),
              color: AppTheme.green.withOpacity(0.05),
            ),
            child: Text(
              '"Inspirer l\'innovation, favoriser l\'évolution, et préserver les acquis tangibles qui constituent le socle de l\'humanité."',
              style: AppTheme.bodyLarge.copyWith(
                fontStyle: FontStyle.italic,
                color: AppTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPillars(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    const pillars = [
      _Pillar(
        icon: Icons.lightbulb_outline,
        color: AppTheme.yellow,
        title: 'Innovation',
        description:
            'Adopter les technologies les plus avancées pour transformer les pratiques agricoles traditionnelles.',
      ),
      _Pillar(
        icon: Icons.trending_up_outlined,
        color: AppTheme.green,
        title: 'Évolution',
        description:
            'Accompagner chaque agriculteur dans sa progression vers une agriculture toujours plus performante.',
      ),
      _Pillar(
        icon: Icons.anchor_outlined,
        color: AppTheme.orange,
        title: 'Conservation',
        description:
            'Préserver les savoirs ancestraux et les équilibres naturels qui fondent l\'agriculture durable.',
      ),
    ];

    return isMobile
        ? Column(
            children: pillars.asMap().entries.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _PillarCard(pillar: e.value, index: e.key),
              );
            }).toList(),
          )
        : Row(
            children: pillars.asMap().entries.map((e) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: e.key == 1 ? 16 : 0),
                  child: _PillarCard(pillar: e.value, index: e.key),
                ),
              );
            }).toList(),
          );
  }
}

class _Pillar {
  final IconData icon;
  final Color color;
  final String title;
  final String description;

  const _Pillar({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
  });
}

class _PillarCard extends StatefulWidget {
  final _Pillar pillar;
  final int index;

  const _PillarCard({required this.pillar, required this.index});

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return ScrollReveal(
      delay: Duration(milliseconds: widget.index * 150),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()
            ..translate(0.0, _hovered ? -6.0 : 0.0),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            border: Border.all(
              color: _hovered
                  ? widget.pillar.color.withOpacity(0.4)
                  : AppTheme.greyBorder,
            ),
            color: _hovered
                ? widget.pillar.color.withOpacity(0.05)
                : AppTheme.surface.withOpacity(0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.pillar.icon,
                  color: widget.pillar.color, size: 32),
              const SizedBox(height: 16),
              Text(widget.pillar.title,
                  style: AppTheme.headlineMedium.copyWith(
                    color: widget.pillar.color,
                  )),
              const SizedBox(height: 10),
              Text(widget.pillar.description,
                  style: AppTheme.bodyMedium.copyWith(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
