import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_counter.dart';

// ============================================================
// SHARED: Detail Section Widget
// ============================================================
class ServiceDetailSection extends StatelessWidget {
  final String sectionTag;
  final String serviceName;
  final String headline;
  final String description;
  final Color accentColor;
  final LinearGradient gradient;
  final List<_DetailFeature> features;
  final List<_StatItem> stats;
  final List<_Step> steps;
  final bool imageLeft; // false = image right

  const ServiceDetailSection({
    super.key,
    required this.sectionTag,
    required this.serviceName,
    required this.headline,
    required this.description,
    required this.accentColor,
    required this.gradient,
    required this.features,
    required this.stats,
    required this.steps,
    this.imageLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.black,
            accentColor.withOpacity(0.04),
            AppTheme.black,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: AppTheme.spacingXL,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Top content (text + visual)
              isMobile
                  ? Column(
                      children: [
                        _buildVisual(context),
                        const SizedBox(height: 40),
                        _buildText(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: imageLeft
                          ? [
                              Expanded(child: _buildVisual(context)),
                              const SizedBox(width: 64),
                              Expanded(child: _buildText(context)),
                            ]
                          : [
                              Expanded(child: _buildText(context)),
                              const SizedBox(width: 64),
                              Expanded(child: _buildVisual(context)),
                            ],
                    ),

              if (steps.isNotEmpty) ...[
                const SizedBox(height: 80),
                _buildSteps(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return ScrollReveal(
      beginOffset: imageLeft ? const Offset(40, 0) : const Offset(-40, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Service tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: accentColor.withOpacity(0.3)),
            ),
            child: Text(
              sectionTag,
              style: AppTheme.labelMedium.copyWith(color: accentColor),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            headline,
            style: AppTheme.displaySmall.copyWith(
              fontSize: isMobile ? 28 : 38,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 16),
          Text(description, style: AppTheme.bodyLarge),
          const SizedBox(height: 32),

          // Feature list
          ...features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(f.icon, color: accentColor, size: 16),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(f.title,
                              style: AppTheme.headlineMedium.copyWith(
                                fontSize: 16,
                              )),
                          Text(f.description, style: AppTheme.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: 32),

          // Stats row
          if (stats.isNotEmpty)
            Row(
              children: stats.map((s) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.value,
                          style: AppTheme.displaySmall.copyWith(
                            color: accentColor,
                            fontSize: 36,
                          )),
                      Text(s.label,
                          style: AppTheme.bodySmall.copyWith(fontSize: 13)),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildVisual(BuildContext context) {
    return ScrollReveal(
      delay: const Duration(milliseconds: 200),
      beginOffset: imageLeft ? const Offset(-40, 0) : const Offset(40, 0),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              accentColor.withOpacity(0.08),
              accentColor.withOpacity(0.02),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(
            color: accentColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // Grid pattern
            Positioned.fill(
              child: CustomPaint(painter: _GridPainter(accentColor)),
            ),
            // Content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: gradient,
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withOpacity(0.4),
                          blurRadius: 40,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: Icon(
                      features.isNotEmpty ? features[0].icon : Icons.star,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    serviceName,
                    style: AppTheme.displaySmall.copyWith(
                      color: accentColor,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Agrinnov',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.grey,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSteps(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return Column(
      children: [
        Text(
          'Comment ça fonctionne ?',
          style: AppTheme.headlineLarge.copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: steps.asMap().entries.map((e) {
                  return _buildStep(e.key, e.value);
                }).toList(),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: steps.asMap().entries.map((e) {
                  return Expanded(child: _buildStep(e.key, e.value));
                }).toList(),
              ),
      ],
    );
  }

  Widget _buildStep(int index, _Step step) {
    return ScrollReveal(
      delay: Duration(milliseconds: index * 100),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: accentColor.withOpacity(0.3)),
                    color: accentColor.withOpacity(0.08),
                  ),
                ),
                Text(
                  '${index + 1}',
                  style: AppTheme.headlineMedium.copyWith(color: accentColor),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(step.title,
                style: AppTheme.headlineMedium.copyWith(fontSize: 16),
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(step.description,
                style: AppTheme.bodySmall, textAlign: TextAlign.center),
          ],
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
      ..color = color.withOpacity(0.07)
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

class _DetailFeature {
  final IconData icon;
  final String title;
  final String description;

  const _DetailFeature(this.icon, this.title, this.description);
}

class _StatItem {
  final String value;
  final String label;
  const _StatItem(this.value, this.label);
}

class _Step {
  final String title;
  final String description;
  const _Step(this.title, this.description);
}

// ============================================================
// DARIS SECTION
// ============================================================
class DarisSection extends StatelessWidget {
  const DarisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceDetailSection(
      sectionTag: 'SERVICE 01 — DiARIS',
      serviceName: 'DiARIS',
      headline: 'Démocratiser\nl\'analyse de sol\npour tous',
      description:
          'DiARIS est une solution technologique innovante (AgTech) d\'agronomie de précision développée par AGRINNOV. Elle comble le fossé entre la recherche scientifique, les données complexes du sol et les besoins pratiques des producteurs sur le terrain — en fournissant des diagnostics rapides, accessibles et des recommandations sur mesure.',
      accentColor: AppTheme.green,
      gradient: AppTheme.greenGradient,
      imageLeft: false,
      features: const [
        _DetailFeature(
          Icons.biotech_outlined,
          'Agronomie de précision',
          'Analyse non destructive et instantanée de la composition minérale et organique de votre sol via technologies de pointe.',
        ),
        _DetailFeature(
          Icons.eco_outlined,
          'Régénération agroécologique',
          'Accompagne la régénération durable des terres agricoles grâce à des recommandations scientifiques précises.',
        ),
        _DetailFeature(
          Icons.description_outlined,
          'Rapport personnalisé',
          'Un diagnostic rapide et accessible avec des recommandations sur mesure adaptées à votre type de culture et de sol.',
        ),
      ],
      stats: const [
        _StatItem('98%', 'Précision d\'analyse'),
        _StatItem('< 4h', 'Résultats livrés'),
        _StatItem('Sur mesure', 'Recommandations'),
      ],
      steps: const [
        _Step('Collecte d\'échantillon', 'Prélèvement standardisé sur votre parcelle'),
        _Step('Analyse spectrale', 'Scan NIR et traitement IA en laboratoire'),
        _Step('Rapport & Diagnostic', 'Résultats détaillés sur votre espace digital'),
        _Step('Plan d\'action', 'Recommandations fertilisation et amendements'),
        _Step('Suivi continu', 'Monitoring de l\'évolution de votre sol'),
      ],
    );
  }
}

// ============================================================
// FARE SECTION
// ============================================================
class FareSection extends StatelessWidget {
  const FareSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F0F0F),
      child: ServiceDetailSection(
        sectionTag: 'SERVICE 02 — FARE',
        serviceName: 'FARE',
        headline: 'Incubateur pratique\npour jeunes\nagropreneurs',
        description:
            'Le Programme FARE (Formation et Accompagnement à la Réussite Entrepreneuriat/Agricole), développé en partenariat avec FL AGRO LEADER, est un incubateur pratique et accélérateur de compétences. Il démystifie la production agricole et sécurise les investissements des porteurs de projets grâce à des compétences techniques de pointe et des outils de gestion entrepreneuriale.',
        accentColor: AppTheme.yellow,
        gradient: AppTheme.yellowGradient,
        imageLeft: true,
        features: const [
          _DetailFeature(
            Icons.class_outlined,
            'Formation pratique de terrain',
            'Sessions immersives sur des sites de référence, ciblées par filières à haute valeur ajoutée (gingembre, piment, etc.).',
          ),
          _DetailFeature(
            Icons.people_alt_outlined,
            'Réseautage & Écosystème Alumni',
            'Mise en relation directe entre apprenants, experts-formateurs et partenaires. Communauté solidaire pour briser l\'isolement des jeunes agripreneurs.',
          ),
          _DetailFeature(
            Icons.handshake_outlined,
            'Transfert de compétences',
            'Fiches techniques, itinéraires et méthodes de production résilientes pour être immédiatement opérationnel dès la fin de formation.',
          ),
        ],
        stats: const [
          _StatItem('10+', 'Élèves formés'),
          _StatItem('FL Agro', 'Partenaire'),
          _StatItem('Terrain', 'Approche pratique'),
        ],
        steps: const [
          _Step('Diagnostic entrepreneurial', 'Évaluation de votre profil et de vos objectifs'),
          _Step('Programme sur mesure', 'Sélection des filières et modules adaptés'),
          _Step('Formation & Ateliers', 'Apprentissage immersif sur sites de référence'),
          _Step('Mise en \u0153uvre', 'Application concrète : lancement de votre exploitation'),
          _Step('Intégration Alumni', 'Rejoindre le réseau et partager vos expériences'),
        ],
      ),
    );
  }
}

// ============================================================
// AGRINNOV ADVISORY SECTION
// ============================================================
class ConsultationSection extends StatelessWidget {
  const ConsultationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceDetailSection(
      sectionTag: 'SERVICE 03 — ADVISORY',
      serviceName: 'Advisory',
      headline: 'Pilotez la croissance\nde votre exploitation\nagroalimentaire',
      description:
          'AGRINNOV Advisory est le pôle de conseil en gestion, d\'ingénierie d\'affaires et de pilotage stratégique d\'AGRINNOV. Il accompagne les entrepreneurs agroalimentaires, PME agricoles, investisseurs et coopératives dans la transformation de leurs exploitations en entreprises rentables, structurées, résilientes et bancables.',
      accentColor: AppTheme.orange,
      gradient: AppTheme.orangeGradient,
      imageLeft: false,
      features: const [
        _DetailFeature(
          Icons.business_center_outlined,
          'Ingénierie d\'affaires',
          'Création de nouvelle exploitation, restructuration de PME agricole existante ou déploiement de projet d\'envergure.',
        ),
        _DetailFeature(
          Icons.trending_up_outlined,
          'Pilotage stratégique',
          'Croissance globale, sécurisation de la rentabilité à long terme et gestion d\'entreprise rigoureuse.',
        ),
        _DetailFeature(
          Icons.analytics_outlined,
          'Bankabilité & Investissement',
          'Préparation aux exigences des investisseurs et du marché pour sécuriser vos financements et partenariats.',
        ),
      ],
      stats: const [
        _StatItem('6', 'Clients accompagnés'),
        _StatItem('PME', 'Agricoles & Coops'),
        _StatItem('360°', 'Vision stratégique'),
      ],
      steps: const [
        _Step('Audit & Diagnostic', 'Analyse de votre situation, potentiel et besoins'),
        _Step('Stratégie personnalisée', 'Élaboration d\'un plan de croissance sur mesure'),
        _Step('Mise en oeuvre', 'Déploiement des outils de gestion et des processus'),
        _Step('Suivi & Mesure', 'Indicateurs clés, optimisations et reporting'),
      ],
    );
  }
}
