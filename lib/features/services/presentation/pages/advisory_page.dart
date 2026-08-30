import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_counter.dart';
import '../../../../shared/footer_widget.dart';
import '../widgets/service_header.dart';

class AdvisoryPage extends StatelessWidget {
  const AdvisoryPage({super.key});

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

            // 3. SERVICE DETAILS (DOMAINES D'EXPERTISE)
            _buildExpertiseSection(context),

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
            AppTheme.orange.withOpacity(0.05),
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
                painter: _GridPainter(AppTheme.orange),
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
                    color: AppTheme.orange.withOpacity(0.08),
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
                        color: AppTheme.orange.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppTheme.orange.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'CONSEIL EN AGRO-MANAGEMENT',
                        style: AppTheme.labelMedium.copyWith(
                          color: AppTheme.orangeLight,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      'AGRINNOV Advisory',
                      style: AppTheme.displayLarge.copyWith(
                        fontSize: isMobile ? 38 : 64,
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
                        "Transformer vos exploitations agricoles en entreprises rentables, hautement structurées, résilientes et bancables.",
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
            'PILOTAGE STRATÉGIQUE',
            style: AppTheme.labelLarge.copyWith(color: AppTheme.orange),
          ),
          const SizedBox(height: 16),
          Text(
            'Sécurisez la croissance globale de vos projets agroalimentaires',
            style: AppTheme.headlineLarge.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 24),
          Text(
            "AGRINNOV Advisory est le pôle de conseil en gestion, d’ingénierie d’affaires et de pilotage stratégique d’AGRINNOV. Il vise à accompagner les entrepreneurs agroalimentaires, les PME agricoles, les investisseurs et les coopératives dans la transformation de leurs exploitations en entreprises rentables, hautement structurées, résilientes et bancables.",
            style: AppTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Text(
            "Que ce soit pour créer une nouvelle exploitation, restructurer une PME agricole existante ou déployer un projet d'envergure, AGRINNOV Advisory pilote la croissance globale, sécurise la rentabilité à long terme et garantit une gestion d'entreprise rigoureuse répondant aux exigences des investisseurs et du marché.",
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
              endValue: 6,
              suffix: '',
              label: "Grands projets et PME accompagnés",
              color: AppTheme.orange,
            ),
            const SizedBox(height: 24),
            Container(height: 1, color: AppTheme.greyBorder),
            const SizedBox(height: 24),
            const AnimatedCounter(
              endValue: 360,
              suffix: '°',
              label: "Accompagnement managérial et financier",
              color: AppTheme.orange,
            ),
            const SizedBox(height: 24),
            Container(height: 1, color: AppTheme.greyBorder),
            const SizedBox(height: 24),
            Text(
              "Profil d'accompagnement",
              style: AppTheme.labelMedium.copyWith(color: AppTheme.grey),
            ),
            const SizedBox(height: 8),
            Text(
              "Investisseurs & Coopératives",
              style: AppTheme.headlineMedium.copyWith(fontSize: 18, color: AppTheme.orange),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpertiseSection(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    final expertise = [
      (
        '01',
        'Ingénierie d\'Affaires',
        'Études de faisabilité, business plans de haut niveau, structuration financière pour création de nouvelles exploitations ou restructurations.',
        Icons.business_center_outlined
      ),
      (
        '02',
        'Pilotage Stratégique',
        'Conseil en gestion continue, optimisation des chaînes de production et d\'approvisionnement, et sécurisation de la rentabilité.',
        Icons.trending_up_outlined
      ),
      (
        '03',
        'Conformité & Investisseurs',
        'Mise en place de processus de gestion rigoureux et d\'outils de reporting conformes aux attentes des institutions financières et du marché international.',
        Icons.analytics_outlined
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
                      'EXPERTISE',
                      style: AppTheme.labelLarge.copyWith(color: AppTheme.orange),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nos Domaines d\'Intervention',
                      style: AppTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
              isMobile
                  ? Column(
                      children: expertise.map((e) => _buildExpertiseCard(e.$1, e.$2, e.$3, e.$4)).toList(),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: expertise
                          .map((e) => Expanded(
                                child: _buildExpertiseCard(e.$1, e.$2, e.$3, e.$4),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpertiseCard(String num, String title, String desc, IconData icon) {
    return ScrollReveal(
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(28),
        height: 380,
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
                    color: AppTheme.orange.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    num,
                    style: AppTheme.labelMedium.copyWith(color: AppTheme.orange),
                  ),
                ),
                Icon(icon, color: AppTheme.orange, size: 24),
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
                  colors: [AppTheme.surface, AppTheme.orange.withOpacity(0.06)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                border: Border.all(color: AppTheme.orange.withOpacity(0.3), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.orange.withOpacity(0.05),
                    blurRadius: 40,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Structurez votre projet agricole avec nos conseillers',
                    style: AppTheme.displaySmall.copyWith(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Bénéficiez d\'une expertise rigoureuse pour sécuriser vos levées de fonds et accroître votre rentabilité de marché.',
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
                      backgroundColor: AppTheme.orange,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Planifier un entretien conseil',
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
