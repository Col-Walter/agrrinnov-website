import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_counter.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.85);

  static const _testimonials = [
    _Testimonial(
      name: 'Mamadou Koné',
      role: 'Agriculteur céréalier, Côte d\'Ivoire',
      quote:
          'Avant DiARIS, je fertilisais au feeling. Maintenant, je sais exactement ce que mon sol a besoin. En une saison, mes rendements ont augmenté de 35%.',
      service: 'DiARIS',
      color: AppTheme.green,
      initial: 'M',
    ),
    _Testimonial(
      name: 'Aïcha Traoré',
      role: 'Jeune agricultrice, Mali',
      quote:
          'La formation FARE m\'a donné les outils pour transformer ma petite exploitation en une vraie entreprise agricole. J\'ai maintenant 3 employés et des clients fidèles.',
      service: 'FARE',
      color: AppTheme.yellow,
      initial: 'A',
    ),
    _Testimonial(
      name: 'Ibrahim Diallo',
      role: 'Producteur de cacao, Ghana',
      quote:
          'L\'équipe de consultation Agrinnov nous a aidés à identifier nos premiers clients export. En 6 mois, nous avons signé 4 contrats internationaux.',
      service: 'Consultation',
      color: AppTheme.orange,
      initial: 'I',
    ),
    _Testimonial(
      name: 'Fatou Camara',
      role: 'Coopérative maraîchère, Sénégal',
      quote:
          'DiARIS nous a révélé une carence en phosphore que nous n\'aurions jamais identifiée seuls. Notre production a doublé après les amendements recommandés.',
      service: 'DiARIS',
      color: AppTheme.green,
      initial: 'F',
    ),
    _Testimonial(
      name: 'Kofi Mensah',
      role: 'Entrepreneur agricole, Bénin',
      quote:
          'FARE m\'a appris à penser comme un entrepreneur, pas seulement comme un agriculteur. Aujourd\'hui je gère une exploitation de 50 hectares avec confiance.',
      service: 'FARE',
      color: AppTheme.yellow,
      initial: 'K',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return Container(
      color: AppTheme.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : AppTheme.sectionPadding(context),
        vertical: AppTheme.spacingXL,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 0,
            ),
            child: ScrollReveal(
              child: Column(
                children: [
                  Text(
                    'TÉMOIGNAGES',
                    style: AppTheme.labelLarge.copyWith(
                      color: AppTheme.orange,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ils font confiance\nà Agrinnov',
                    style: AppTheme.displaySmall.copyWith(
                      fontSize: isMobile ? 30 : 42,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 48),

          SizedBox(
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _testimonials.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (context, index) {
                final t = _testimonials[index];
                final isActive = index == _currentIndex;
                return AnimatedScale(
                  scale: isActive ? 1.0 : 0.94,
                  duration: const Duration(milliseconds: 300),
                  child: _TestimonialCard(testimonial: t, isActive: isActive),
                );
              },
            ),
          ),

          const SizedBox(height: 32),

          // Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_testimonials.length, (i) {
              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _currentIndex ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: i == _currentIndex
                        ? AppTheme.green
                        : AppTheme.greyBorder,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _Testimonial {
  final String name;
  final String role;
  final String quote;
  final String service;
  final Color color;
  final String initial;

  const _Testimonial({
    required this.name,
    required this.role,
    required this.quote,
    required this.service,
    required this.color,
    required this.initial,
  });
}

class _TestimonialCard extends StatelessWidget {
  final _Testimonial testimonial;
  final bool isActive;

  const _TestimonialCard({required this.testimonial, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        border: Border.all(
          color: isActive
              ? testimonial.color.withOpacity(0.4)
              : AppTheme.greyBorder,
          width: isActive ? 1.5 : 1,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: testimonial.color.withOpacity(0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 8),
                )
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Quote icon
              Icon(Icons.format_quote, color: testimonial.color, size: 32),
              const Spacer(),
              // Service badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: testimonial.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  testimonial.service,
                  style: AppTheme.labelMedium.copyWith(
                    color: testimonial.color,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Text(
              '"${testimonial.quote}"',
              style: AppTheme.bodyLarge.copyWith(
                fontStyle: FontStyle.italic,
                color: const Color(0xFFDDDDDD),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      testimonial.color,
                      testimonial.color.withOpacity(0.6)
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    testimonial.initial,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(testimonial.name,
                      style: AppTheme.headlineMedium.copyWith(fontSize: 15)),
                  Text(testimonial.role,
                      style: AppTheme.bodySmall.copyWith(fontSize: 13)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
