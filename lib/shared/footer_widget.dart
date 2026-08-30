import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';
import '../features/home/presentation/sections/legal_section.dart';

class FooterWidget extends StatelessWidget {
  final Function(String)? onNavigationSelected;

  const FooterWidget({
    super.key,
    this.onNavigationSelected,
  });

  void _handleNavigation(BuildContext context, String target) {
    if (onNavigationSelected != null) {
      onNavigationSelected!(target);
    } else {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop(target);
      } else {
        Navigator.of(context).pushReplacementNamed('/', arguments: target);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0A0A0A),
        border: Border(top: BorderSide(color: AppTheme.greyBorder, width: 1)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.sectionPadding(context),
        vertical: 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrand(),
                        const SizedBox(height: 40),
                        _buildLinks(context),
                        const SizedBox(height: 40),
                        _buildServices(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: _buildBrand()),
                        const SizedBox(width: 40),
                        Expanded(child: _buildLinks(context)),
                        const SizedBox(width: 40),
                        Expanded(child: _buildServices(context)),
                      ],
                    ),
              const SizedBox(height: 48),
              Container(height: 1, color: AppTheme.greyBorder),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© ${DateTime.now().year} Agrinnov. Tous droits réservés.',
                    style: AppTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Builder(builder: (ctx) => _FooterLink('Mentions légales', () => showLegalModal(ctx))),
                      const SizedBox(width: 16),
                      Builder(builder: (ctx) => _FooterLink('Confidentialité', () => showLegalModal(ctx, showPrivacy: true))),
                      const SizedBox(width: 16),
                      _FooterLink('contact@agrinnov.tech', () {
                        launchUrl(Uri.parse('mailto:contact@agrinnov.tech'));
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrand() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo_principal.png',
              height: 80,
              filterQuality: FilterQuality.high,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'L\'innovation au cœur\nde l\'agriculture de demain.',
          style: AppTheme.bodyMedium.copyWith(color: AppTheme.grey),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _SocialIcon(
              color: const Color(0xFF1877F2),
              url: 'https://facebook.com/agrinnovbj',
              child: Image.asset(
                'assets/images/icon_facebook.png',
                width: 20,
                height: 20,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(width: 12),
            _SocialIcon(
              color: const Color(0xFF0A66C2),
              url: 'https://www.linkedin.com/company/agrinnovbj/',
              child: Image.asset(
                'assets/images/icon_linkedin.png',
                width: 20,
                height: 20,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(width: 12),
            _SocialIcon(
              color: const Color(0xFF25D366),
              url: 'https://wa.me/22940793731',
              child: Image.asset(
                'assets/images/icon_whatsapp.png',
                width: 20,
                height: 20,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLinks(BuildContext context) {
    final links = [
      ('Accueil', 'home'),
      ('Nos Services', 'services'),
      ('Notre Vision', 'vision'),
      ('Contact', 'contact'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Navigation',
            style: AppTheme.labelMedium.copyWith(color: AppTheme.white)),
        const SizedBox(height: 16),
        ...links.map((l) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _FooterLink(l.$1, () => _handleNavigation(context, l.$2)),
            )),
      ],
    );
  }

  Widget _buildServices(BuildContext context) {
    final services = [
      ('DiARIS', AppTheme.green, '/diaris'),
      ('FARE', AppTheme.yellow, '/fare'),
      ('Advisory', AppTheme.orange, '/advisory'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nos Services',
            style: AppTheme.labelMedium.copyWith(color: AppTheme.white)),
        const SizedBox(height: 16),
        ...services.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _FooterServiceLink(
                label: s.$1,
                color: s.$2,
                onTap: () {
                  final currentRoute = ModalRoute.of(context)?.settings.name;
                  if (currentRoute == s.$3) {
                    // Already on this page
                  } else {
                    Navigator.of(context).pushNamed(s.$3);
                  }
                },
              ),
            )),
      ],
    );
  }
}

class _FooterServiceLink extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _FooterServiceLink({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_FooterServiceLink> createState() => _FooterServiceLinkState();
}

class _FooterServiceLinkState extends State<_FooterServiceLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: _hovered ? widget.color : AppTheme.grey,
                fontSize: 14,
                fontFamily: 'Outfit',
              ),
              child: Text(widget.label),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink(this.label, this.onTap);

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: _hovered ? AppTheme.green : AppTheme.grey,
            fontSize: 14,
            fontFamily: 'Outfit',
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final Widget child;
  final Color color;
  final String url;

  const _SocialIcon({
    required this.child,
    required this.color,
    required this.url,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.color,
            boxShadow: _hovered
                ? <BoxShadow>[
                    BoxShadow(
                      color: widget.color.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ]
                : const <BoxShadow>[],
            border: Border.all(
              color: _hovered ? Colors.white : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.5),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: _hovered ? 1.1 : 1.0,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}


