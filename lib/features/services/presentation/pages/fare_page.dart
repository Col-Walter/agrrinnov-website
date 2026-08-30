import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_counter.dart';
import '../../../../shared/footer_widget.dart';
import '../widgets/service_header.dart';

class FarePage extends StatelessWidget {
  const FarePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: const ServiceHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. HERO SECTION WITH GLOW & GRID
            _buildHeroSection(context),

            // 2. MAIN PRESENTATION & STATS
            _buildPresentationSection(context),

            // 3. PILIERS DU PROGRAMME
            _buildPillarsSection(context),

            // 4. CTA BANNER
            _buildCtaBanner(context),

            // 5. FOOTER
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Container(
      height: isMobile ? 380 : 450,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.black,
            AppTheme.yellow.withOpacity(0.05),
            AppTheme.black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Background Grid
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: CustomPaint(
                painter: _GridPainter(AppTheme.yellow),
              ),
            ),
          ),
          // Radial Glow
          Positioned(
            top: -100,
            left: MediaQuery.of(context).size.width / 2 - 250,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.yellow.withOpacity(0.1),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          // Hero content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.sectionPadding(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScrollReveal(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.yellow.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppTheme.yellow.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'PROGRAMME AGRINNOV',
                        style: AppTheme.labelMedium.copyWith(
                          color: AppTheme.yellow,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      'Programme FARE',
                      style: AppTheme.displayLarge.copyWith(
                        fontSize: isMobile ? 42 : 72,
                        height: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 200),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Text(
                        "Formation et Accompagnement à la Réussite Entrepreuneuriat Agricole.",
                        style: AppTheme.bodyLarge.copyWith(
                          color: AppTheme.grey,
                          fontSize: isMobile ? 16 : 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPresentationSection(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOverviewText(context),
                    const SizedBox(height: 48),
                    _buildStatsBox(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildOverviewText(context),
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      flex: 2,
                      child: _buildStatsBox(context),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildOverviewText(BuildContext context) {
    return ScrollReveal(
      beginOffset: const Offset(-20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'L\'INCUBATEUR PRATIQUE',
            style: AppTheme.labelLarge.copyWith(color: AppTheme.yellow),
          ),
          const SizedBox(height: 16),
          Text(
            'Sécuriser vos investissements par le savoir-faire terrain',
            style: AppTheme.headlineLarge.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 24),
          Text(
            "Le Programme FARE (Formation et Accompagnement à la Réussite Entrepreneuriat/Agricole) est une initiative portée par la firme AGRINNOV, développée en partenariat avec des entreprises agricoles et institutions intervenant au Bénin. Il est conçu comme un incubateur pratique et un accélérateur de compétences destiné aux jeunes agropreneurs, producteurs et porteurs de projets agricoles.",
            style: AppTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Text(
            "Objectif Principal",
            style: AppTheme.headlineMedium.copyWith(fontSize: 20, color: AppTheme.white),
          ),
          const SizedBox(height: 8),
          Text(
            "Le programme vise à démystifier la production agricole et à sécuriser les investissements des porteurs de projets en leur fournissant à la fois des compétences techniques de pointe, de la pratique terrain éprouvée et des outils de gestion entrepreneuriale.",
            style: AppTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsBox(BuildContext context) {
    return ScrollReveal(
      beginOffset: const Offset(20, 0),
      delay: const Duration(milliseconds: 150),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(color: AppTheme.greyBorder),
        ),
        child: Column(
          children: [
            const AnimatedCounter(
              endValue: 10,
              suffix: '',
              label: "Élèves & Agropreneurs formés",
              color: AppTheme.yellow,
            ),
            const SizedBox(height: 24),
            Container(height: 1, color: AppTheme.greyBorder),
            const SizedBox(height: 24),
            const AnimatedCounter(
              endValue: 100,
              suffix: '%',
              label: "Pratique immersive sur site",
              color: AppTheme.yellow,
            ),
            const SizedBox(height: 24),
            Container(height: 1, color: AppTheme.greyBorder),
            const SizedBox(height: 24),
            Text(
              "Réseau Partenarial",
              style: AppTheme.labelMedium.copyWith(color: AppTheme.grey),
            ),
            const SizedBox(height: 8),
            Text(
              "Entreprises & Institutions du Bénin",
              style: AppTheme.headlineMedium.copyWith(fontSize: 16, color: AppTheme.yellow),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPillarsSection(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    final pillars = [
      (
        '01',
        'Formation Pratique de Terrain',
        'Immersions directes sur des sites de référence chez des entreprises agricoles et institutions partenaires intervenant au Bénin, axées sur des filières stratégiques à haute valeur ajoutée.',
        Icons.grass_outlined
      ),
      (
        '02',
        'Accompagnement & Transfert',
        'Transmission de fiches techniques opérationnelles, d\'itinéraires techniques précis et de méthodes de production résilientes pour être immédiatement prêt à lancer son exploitation.',
        Icons.swap_calls_outlined
      ),
      (
        '03',
        'Réseautage & Écosystème (Alumni)',
        'Mise en relation directe entre apprenants, experts-formateurs et partenaires techniques. Une communauté solidaire post-formation pour briser l\'isolement des agripreneurs.',
        Icons.groups_outlined
      ),
    ];

    return Container(
      color: const Color(0xFF0F0F0F),
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: 80,
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
                      'STRUCTURE',
                      style: AppTheme.labelLarge.copyWith(color: AppTheme.yellow),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Les 3 Piliers du Programme',
                      style: AppTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
              isMobile
                  ? Column(
                      children: pillars.map((p) => _buildPillarCard(p.$1, p.$2, p.$3, p.$4)).toList(),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pillars
                          .map((p) => Expanded(
                                child: _buildPillarCard(p.$1, p.$2, p.$3, p.$4),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPillarCard(String num, String title, String desc, IconData icon) {
    return ScrollReveal(
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(28),
        height: 380, // fixed height for alignment on desktop
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          border: Border.all(color: AppTheme.greyBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.yellow.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    num,
                    style: AppTheme.labelMedium.copyWith(color: AppTheme.yellow),
                  ),
                ),
                Icon(icon, color: AppTheme.yellow, size: 24),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: AppTheme.headlineMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              desc,
              style: AppTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCtaBanner(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ScrollReveal(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 56),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.surface, AppTheme.yellow.withOpacity(0.06)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                border: Border.all(color: AppTheme.yellow.withOpacity(0.3), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.yellow.withOpacity(0.05),
                    blurRadius: 40,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Rejoignez la prochaine cohorte FARE',
                    style: AppTheme.displaySmall.copyWith(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Passez du projet théorique à l\'exploitation agricole structurée et rentable grâce à notre accompagnement pratique.',
                    style: AppTheme.bodyLarge.copyWith(color: AppTheme.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop('contact');
                      } else {
                        Navigator.of(context).pushReplacementNamed('/', arguments: 'contact');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.yellow,
                      foregroundColor: AppTheme.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'S\'inscrire / Demander des infos',
                      style: AppTheme.labelLarge.copyWith(
                        fontSize: 15,
                        color: AppTheme.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color color;
  _GridPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.04)
      ..strokeWidth = 1;
    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => old.color != color;
}
