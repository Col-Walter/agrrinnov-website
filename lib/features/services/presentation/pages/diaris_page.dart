import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_counter.dart';
import '../../../../shared/footer_widget.dart';
import '../widgets/service_header.dart';

class DiarisPage extends StatelessWidget {
  const DiarisPage({super.key});

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

            // 2. DETAILED CONTENT SECTION
            _buildDetailsSection(context),

            // 3. STEPS SECTION (HOW IT WORKS)
            _buildStepsSection(context),

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
      height: isMobile ? 350 : 450,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.black,
            AppTheme.green.withOpacity(0.06),
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
                painter: _GridPainter(AppTheme.green),
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
                    color: AppTheme.green.withOpacity(0.12),
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
                        color: AppTheme.green.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppTheme.green.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'AGRONOMIE DE PRÉCISION (AGTECH)',
                        style: AppTheme.labelMedium.copyWith(
                          color: AppTheme.greenLight,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      'DiARIS',
                      style: AppTheme.displayLarge.copyWith(
                        fontSize: isMobile ? 48 : 72,
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
                        "Démocratiser l'analyse de sol et accompagner la régénération agroécologique des terres agricoles.",
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

  Widget _buildDetailsSection(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Side-by-side: Description & Stats
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDescriptionText(context),
                        const SizedBox(height: 48),
                        _buildStatsGrid(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _buildDescriptionText(context),
                        ),
                        const SizedBox(width: 80),
                        Expanded(
                          flex: 2,
                          child: _buildStatsGrid(context),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionText(BuildContext context) {
    return ScrollReveal(
      beginOffset: const Offset(-20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Présentation générale',
            style: AppTheme.labelLarge.copyWith(color: AppTheme.green),
          ),
          const SizedBox(height: 16),
          Text(
            'Combler le fossé entre la science et le terrain',
            style: AppTheme.headlineLarge.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 24),
          Text(
            "DiARIS est une solution technologique innovante (AgTech) d'agronomie de précision développée par AGRINNOV, conçue pour démocratiser l'analyse de sol et accompagner la régénération agroécologique des terres agricoles.",
            style: AppTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Text(
            "Son objectif principal est de combler le fossé entre la recherche scientifique, les données complexes du sol et les besoins pratiques des producteurs sur le terrain, en fournissant des diagnostics rapides, accessibles et des recommandations sur mesure.",
            style: AppTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          // Features bullets
          _buildBulletFeature(
            Icons.biotech_outlined,
            'Agronomie connectée',
            'Analyses immédiates de la composition minérale et organique de vos parcelles sans destruction de sol.',
          ),
          const SizedBox(height: 16),
          _buildBulletFeature(
            Icons.eco_outlined,
            'Régénération agroécologique',
            'Des plans de fertilisation et de restauration écologique pensés pour la durabilité et la santé biologique de la terre.',
          ),
          const SizedBox(height: 16),
          _buildBulletFeature(
            Icons.dashboard_customize_outlined,
            'Recommandations sur mesure',
            'Traduction directe des données complexes en conseils d\'action simples, applicables par tous les producteurs.',
          ),
        ],
      ),
    );
  }

  Widget _buildBulletFeature(IconData icon, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.green.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppTheme.green, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.headlineMedium.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: AppTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
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
              endValue: 98,
              suffix: '%',
              label: "Précision d'analyse spectral",
              color: AppTheme.green,
            ),
            const SizedBox(height: 24),
            Container(height: 1, color: AppTheme.greyBorder),
            const SizedBox(height: 24),
            const AnimatedCounter(
              endValue: 72,
              suffix: 'h',
              label: "Temps de livraison du rapport",
              color: AppTheme.green,
            ),
            const SizedBox(height: 24),
            Container(height: 1, color: AppTheme.greyBorder),
            const SizedBox(height: 24),
            const AnimatedCounter(
              endValue: 120,
              suffix: '+',
              label: "Parcelles cartographiées",
              color: AppTheme.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepsSection(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    final steps = [
      ('01', 'Collecte d\'échantillon', 'Prélèvement standardisé par nos techniciens sur votre parcelle.'),
      ('02', 'Analyse spectrale', 'Scan par spectrométrie proche infrarouge (NIR) et traitement IA.'),
      ('03', 'Rapport & Diagnostic', 'Génération d\'un rapport clair et accessible avec score de santé de sol.'),
      ('04', 'Plan d\'action personnalisé', 'Recommandations d\'amendements et d\'itinéraires culturaux sur mesure.'),
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
                      'PROCESSUS',
                      style: AppTheme.labelLarge.copyWith(color: AppTheme.green),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Comment fonctionne DiARIS ?',
                      style: AppTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
              isMobile
                  ? Column(
                      children: steps.map((s) => _buildStepCard(s.$1, s.$2, s.$3)).toList(),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: steps
                          .map((s) => Expanded(
                                child: _buildStepCard(s.$1, s.$2, s.$3),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(String num, String title, String desc) {
    return ScrollReveal(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.green.withOpacity(0.12),
                border: Border.all(color: AppTheme.green.withOpacity(0.3)),
              ),
              child: Center(
                child: Text(
                  num,
                  style: AppTheme.headlineMedium.copyWith(color: AppTheme.green),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTheme.headlineMedium.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: AppTheme.bodySmall,
              textAlign: TextAlign.center,
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
                  colors: [AppTheme.surface, AppTheme.green.withOpacity(0.08)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                border: Border.all(color: AppTheme.green.withOpacity(0.3), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.green.withOpacity(0.08),
                    blurRadius: 40,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Optimisez la santé de vos sols dès aujourd\'hui',
                    style: AppTheme.displaySmall.copyWith(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Prenez contact avec nos experts agronomes pour organiser une analyse de vos parcelles.',
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
                      backgroundColor: AppTheme.green,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Demander une analyse DiARIS',
                      style: AppTheme.labelLarge.copyWith(fontSize: 15),
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
      ..color = color.withOpacity(0.05)
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
