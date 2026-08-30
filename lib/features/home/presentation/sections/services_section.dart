import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_counter.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Container(
      color: AppTheme.black,
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: AppTheme.spacingXL,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              ScrollReveal(
                child: Column(
                  children: [
                    Text(
                      'NOS SERVICES',
                      style: AppTheme.labelLarge.copyWith(
                        color: AppTheme.green,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nos 3 Piliers\nd\'Innovation',
                      style: AppTheme.displaySmall.copyWith(
                        fontSize: isMobile ? 32 : 42,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Trois services complémentaires pour accompagner\nles agriculteurs vers la performance et la durabilité.',
                      style: AppTheme.bodyLarge.copyWith(
                          color: AppTheme.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
              isMobile
                  ? Column(
                      children: [
                        _ServiceCard(
                          tag: '01',
                          title: 'DiARIS',
                          subtitle: 'Agronomie de précision (AgTech)',
                          description:
                              'Solution technologique d\'agronomie de précision conçue pour démocratiser l\'analyse de sol et accompagner la régénération agroécologique des terres agricoles.',
                          icon: Icons.biotech_outlined,
                          color: AppTheme.green,
                          gradient: AppTheme.greenGradient,
                          features: ['Analyse de sol rapide', 'Recommandations sur mesure', 'Régénération des terres', 'Diagnostic accessible'],
                          delay: Duration.zero,
                          onTap: () => Navigator.of(context).pushNamed('/diaris'),
                        ),
                        const SizedBox(height: 24),
                        _ServiceCard(
                          tag: '02',
                          title: 'FARE',
                          subtitle: 'Incubateur pratique de terrain',
                          description:
                              'Programme d\'accompagnement pratique en partenariat avec des entreprises agricoles et institutions intervenant au Bénin pour sécuriser vos investissements par la pratique.',
                          icon: Icons.school_outlined,
                          color: AppTheme.yellow,
                          gradient: AppTheme.yellowGradient,
                          features: ['Pratique de terrain immersive', 'Transfert de fiches techniques', 'Réseau Alumni solidaire', 'Filières à haute valeur'],
                          isCenter: false,
                          delay: const Duration(milliseconds: 150),
                          onTap: () => Navigator.of(context).pushNamed('/fare'),
                        ),
                        const SizedBox(height: 24),
                        _ServiceCard(
                          tag: '03',
                          title: 'Advisory',
                          subtitle: 'Conseil en Agro-Management',
                          description:
                              'Pôle de conseil en gestion, d\'ingénierie d\'affaires et de pilotage stratégique pour transformer vos exploitations en entreprises rentables, résilientes et bancables.',
                          icon: Icons.people_outline,
                          color: AppTheme.orange,
                          gradient: AppTheme.orangeGradient,
                          features: ['Ingénierie d\'affaires', 'Pilotage stratégique', 'Rentabilité & Croissance', 'Dossiers bancables'],
                          delay: const Duration(milliseconds: 300),
                          onTap: () => Navigator.of(context).pushNamed('/advisory'),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ServiceCard(
                            tag: '01',
                            title: 'DiARIS',
                            subtitle: 'Agronomie de précision (AgTech)',
                            description:
                                'Solution technologique d\'agronomie de précision conçue pour démocratiser l\'analyse de sol et accompagner la régénération agroécologique des terres agricoles.',
                            icon: Icons.biotech_outlined,
                            color: AppTheme.green,
                            gradient: AppTheme.greenGradient,
                            features: ['Analyse de sol rapide', 'Recommandations sur mesure', 'Régénération des terres', 'Diagnostic accessible'],
                            delay: Duration.zero,
                            onTap: () => Navigator.of(context).pushNamed('/diaris'),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _ServiceCard(
                            tag: '02',
                            title: 'FARE',
                            subtitle: 'Incubateur pratique de terrain',
                            description:
                                'Programme d\'accompagnement pratique en partenariat avec des entreprises agricoles et institutions intervenant au Bénin pour sécuriser vos investissements par la pratique.',
                            icon: Icons.school_outlined,
                            color: AppTheme.yellow,
                            gradient: AppTheme.yellowGradient,
                            features: ['Pratique terrain immersive', 'Fiches & itinéraires techniques', 'Réseau Alumni & Experts', 'Filières stratégiques'],
                            isCenter: true,
                            delay: const Duration(milliseconds: 150),
                            onTap: () => Navigator.of(context).pushNamed('/fare'),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _ServiceCard(
                            tag: '03',
                            title: 'Advisory',
                            subtitle: 'Conseil en Agro-Management',
                            description:
                                'Pôle de conseil en gestion, d\'ingénierie d\'affaires et de pilotage stratégique pour transformer vos exploitations en entreprises rentables, résilientes et bancables.',
                            icon: Icons.people_outline,
                            color: AppTheme.orange,
                            gradient: AppTheme.orangeGradient,
                            features: ['Ingénierie d\'affaires', 'Pilotage stratégique', 'Rentabilité sécurisée', 'Exigences du marché'],
                            delay: const Duration(milliseconds: 300),
                            onTap: () => Navigator.of(context).pushNamed('/advisory'),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String tag;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final LinearGradient gradient;
  final List<String> features;
  final bool isCenter;
  final Duration delay;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    required this.gradient,
    required this.features,
    this.isCenter = false,
    required this.delay,
    required this.onTap,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return ScrollReveal(
      delay: widget.delay,
      beginOffset: const Offset(0, 60),
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.identity()
              ..translate(0.0, _hovered ? -8.0 : (widget.isCenter ? -16.0 : 0.0)),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: _hovered ? AppTheme.surfaceLight : AppTheme.surface,
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              border: Border.all(
                color: _hovered
                    ? widget.color.withOpacity(0.5)
                    : AppTheme.greyBorder,
                width: 1.5,
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: widget.color.withOpacity(0.25),
                        blurRadius: 40,
                        offset: const Offset(0, 12),
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                      )
                    ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tag + Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.tag,
                        style: AppTheme.labelMedium.copyWith(
                          color: widget.color,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: _hovered ? widget.gradient : null,
                        color: _hovered ? null : widget.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(widget.icon,
                          color: _hovered ? AppTheme.white : widget.color,
                          size: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Title
                Text(
                  widget.title,
                  style: AppTheme.displaySmall.copyWith(
                    fontSize: 32,
                    color: widget.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: AppTheme.headlineMedium.copyWith(
                    fontSize: 14,
                    color: AppTheme.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  widget.description,
                  style: AppTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                // Features list
                ...widget.features.map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: widget.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(f,
                              style: AppTheme.bodySmall.copyWith(
                                color: const Color(0xFFCCCCCC),
                                fontSize: 14,
                              )),
                        ],
                      ),
                    )),

                const SizedBox(height: 24),

                // CTA
                Row(
                  children: [
                    Text(
                      'En savoir plus',
                      style: AppTheme.labelMedium.copyWith(color: widget.color),
                    ),
                    const SizedBox(width: 8),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: Matrix4.identity()
                        ..translate(_hovered ? 4.0 : 0.0),
                      child: Icon(Icons.arrow_forward,
                          color: widget.color, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
